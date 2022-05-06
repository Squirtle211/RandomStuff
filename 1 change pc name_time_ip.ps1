Rename-Computer -NewName "Group2DC"
Set-TimeZone -Id "UTC"

$ip = "192.168.237.10"
$netmask = "255.255.255.0"
$gateway = "192.168.237.2"
$dns = "8.8.8.8"


$adapter = Get-WmiObject win32_NetworkAdapterConfiguration -Filter "IPEnabled = 'true'"
$adapter.EnableStatic($ip,$netmask)
$adapter.SetGateways($gateway)
$adapter.SetDNSServerSearchOrder($dns)

Restart-Computer 