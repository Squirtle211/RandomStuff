Rename-Computer -NewName "Group4VM2"
Set-TimeZone -Id "UTC"

#Change to whatever IP settings the professor gives
$ip = "192.168.237.10"
$netmask = "24"
$gateway = "192.168.2.1"
$dns = "192.168.2.115"
$altdns = "8.8.8.8"
$adapter = (Get-NetAdapter).InterfaceIndex

Remove-NetIPAddress -InterfaceIndex $adapter
Remove-NetRoute -InterfaceIndex $adapter -Confirm 

New-NetIPAddress -IPAddress $ip -DefaultGateway $gateway -PrefixLength $netmask -InterfaceIndex $adapter
Set-DnsClientServerAddress -InterfaceIndex $adapter -ServerAddresses $dns, $altdns


Restart-Computer 
