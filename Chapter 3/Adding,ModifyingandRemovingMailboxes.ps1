#example 1:

$password = ConvertTo-SecureString -AsPlainText P@ssw0rd -Force

New-Mailbox -UserPrincipalName dave@contoso.com `
-Alias dave `
-Database DAGDB1 `
-Name DaveJones `
-OrganizationalUnit Sales `
-Password $password `
-FirstName Dave `
-LastName Jones `
-DisplayName ‘Dave Jones’

Set-Mailbox -Identity dave `
-UseDatabaseQuotaDefaults $false `
-ProhibitSendReceiveQuota 5GB `
-IssueWarningQuota 4gb

Disable-Mailbox -Identity dave -Confirm:$false


#example 2:

New-Mailbox -UserPrincipalName dave@contoso.com `
-Alias dave `
-Database DAGDB1 `
-Name DaveJones `
-OrganizationalUnit Sales `
-Password (ConvertTo-SecureString -AsPlainText P@ssw0rd -Force) `
-FirstName Dave `
-LastName Jones `
-DisplayName ‘Dave Jones’


#example 3:

Enable-Mailbox steve -Database DAGDB1


#example 4:

Get-User -RecipientTypeDetails User | 
  Enable-Mailbox -Database DAGDB1

  
#example 5:

Get-Mailbox -OrganizationalUnit contoso.com/sales | 
  Set-Mailbox -UseDatabaseQuotaDefaults $false `
  -ProhibitSendReceiveQuota 5GB `
  -IssueWarningQuota 4gb

  
#example 6:

Remove-Mailbox -Identity dave -Confirm:$false


#example 7:

$pass = Read-Host "Enter Password" -AsSecureString


#example 8:

New-Mailbox -Name Dave -UserPrincipalName dave@contoso.com `
-Password (Get-Credential).password


#example 9:

Set-User –Identity dave –Office IT –City Seattle –State Washington
