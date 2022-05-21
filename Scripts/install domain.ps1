Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools 

#This will prompt you to create a password for Directory Services Restore Mode. Make it and strong password and don't forget it.
Install-ADDsForest -DomainName "group4.local" 

Restart-Computer




