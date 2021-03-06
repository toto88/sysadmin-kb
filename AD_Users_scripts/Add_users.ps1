Import-Module ActiveDirectory

$path = "C:\scripts\"
$ou = "OU=Production ,OU=Users,,DC=comany,DC=com"
$upnsuffix = "@company.com"

Import-Csv "$path\list_add.csv" | Select-Object *,
	@{Name="Name"; Expression={$_.GivenName+" "+$_.Surname}},
        @{Name="Path"; Expression={$ou}},
        @{Name="UserPrincipalName"; Expression={$_.SamAccountName+$upnsuffix}},
        @{Name="AccountPassword"; Expression={ConvertTo-SecureString $_.passwd -AsPlainText -Force}},
        @{Name="Enabled"; Expression={$true}},
        @{Name="CannotChangePassword"; Expression={$true}},
        @{Name="PasswordNeverExpires"; Expression={$true}} | New-ADUser


# To add the users to a specific Group "GROUP1"

$users = Import-Csv "$path\list_add.csv" 
foreach ($user1 in $users) {
Add-ADGroupMember GROUP1 $user1.GivenName
}