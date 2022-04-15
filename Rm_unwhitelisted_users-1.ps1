$gtrain_users = @('Group2 the. Squad', "Zack")



Get-ADUser -Filter *  |
    ForEach-Object{
        if ($_.ObjectClass -eq 'User'){
            if ($gtrain_users -contains $_.Name){     
                Continue                            # moves on if user is not on the whitelist
            }
            else{
                Remove-ADUser -Identity $_.Name -WHATIF # Removes user not on the whitelist
            }
        }
    }