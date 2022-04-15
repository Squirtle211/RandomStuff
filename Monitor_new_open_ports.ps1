param()

    Write-Verbose "Monitors for Reverse Shells"

    $EstablishedConnections = Get-NetTCPConnection -State 'Established' | Sort-Object -Property 'RemoteAddress' -Unique | Select-Object 'LocalPort', 'RemoteAddress', 'RemotePort', 'State', 'AppliedSetting', 'OwningProcess', 'CreationTime'

    If (!(Test-Path -Path 'C:\Users\Public\Desktop\ConnectionHistory.csv'))
    {

        $EstablishedConnections | Export-Csv -Path 'C:\Users\Public\Desktop\ConnectionHistory.csv' -NoTypeInformation

        ForEach ($Established in $EstablishedConnections.RemoteAddress)
        {

            Resolve-DnsName $Established -ErrorAction 'SilentlyContinue' | Select-Object 'Name', 'Type', 'NameHost' | Export-Csv -Path 'C:\Users\Public\Desktop\ConnectionDNSHistory.csv'

        } # End ForEach

    }# End If

    Else
    {

        $NewConnections = Compare-Object -ReferenceObject (Import-Csv -Path 'C:\Users\Public\Desktop\ConnectionHistory.csv') -DifferenceObject $EstablishedConnections -Property 'RemoteAddress' | Where-Object -Process { $_.SideIndicator -like '=>'} | Select-Object -ExpandProperty 'RemoteAddress'

        ForEach ($NewConnection in $NewConnections)
        {

            $EstablishedConnections | Where-Object -Property 'RemoteAddress' -like $NewConnection | Export-Csv -Path 'C:\Users\Public\Desktop\ConnectionHistory.csv' -Append

            Resolve-DnsName -Name $NewConnection -ErrorAction 'SilentlyContinue' | Select-Object 'Name', 'Type', 'NameHost' | Export-Csv -Path 'C:\Users\Public\Desktop\ConnectionDNSHistory.csv' -Append

        } # End ForEach

    } # End Else