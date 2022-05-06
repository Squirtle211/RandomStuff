Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools 

Install-ADDsForest -DomainName "group2.local" -InstallDNS 

Restart-Computer




