$Password = Read-Host -Prompt "Enter a password for this user" -AsSecureString
New-ADUser -Name "Group2" -Description "Domain admin account" -Enabled $true -AccountPassword $Password -PasswordNeverExpires $true
Add-ADGroupMember -Identity "Domain Admins" -Members "Group2"

Disable-ADAccount -Identity "Administrator"
Disable-ADAccount -Identity "Guest"