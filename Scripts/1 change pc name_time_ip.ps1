Rename-Computer -NewName "Group2DC"
Set-TimeZone -Id "UTC"

#Change to whatever IP settings the professor gives
$ip = "192.168.237.10"
$netmask = "24"
$gateway = "192.168.237.2"
$dns = "127.0.0.1"
$altdns = "8.8.8.8"
$adapter = (Get-NetAdapter).InterfaceIndex

Remove-NetIPAddress -InterfaceIndex $adapter
Remove-NetRoute -InterfaceIndex $adapter -Confirm 

New-NetIPAddress -IPAddress $ip -DefaultGateway $gateway -PrefixLength $netmask -InterfaceIndex $adapter
Set-DnsClientServerAddress -InterfaceIndex $adapter -ServerAddresses $dns, $altdns


Restart-Computer 