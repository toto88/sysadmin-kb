Import-Module ActiveDirectory

$path = "C:\scripts\"

$users = Import-Csv "$path\list_modify.csv"

ForEach($user in $users)
{
Set-ADUser -Identity $user.SamAccountName -PasswordNeverExpires:$TRUE
}