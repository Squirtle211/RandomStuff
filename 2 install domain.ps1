$Password = ConvertTo-SecureString -AsPlainText -Force -String = @Password123

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools 

Install-ADDsForest -DomainName "group2.local" -InstallDNS 

Restart-Computer




