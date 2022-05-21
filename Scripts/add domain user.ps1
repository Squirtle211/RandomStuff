#Prompts you to enter a password for the new user. Make it strong and don't forget it.
$user = Read-Host -Prompt "Enter User Name to create"
$Password = Read-Host -Prompt "Enter a password for this user" -AsSecureString
New-ADUser -Name $user -Description "Domain admin account" -Enabled $true -AccountPassword $Password -PasswordNeverExpires $true
Add-ADGroupMember -Identity "Domain Admins" -Members $user

Disable-ADAccount -Identity "Administrator"
Disable-ADAccount -Identity "Guest"
