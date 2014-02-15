#example 1:

Enable-Mailbox –Identity administrator -Archive


#example 2:

Get-Mailbox -Database DB01 | 
  Enable-Mailbox -Archive -ArchiveDatabase ARCHIVE01


#example 3:

$password = ConvertTo-SecureString P@ssword -AsPlainText -Force

New-Mailbox -Name "Dave Smith" -alias dsmith `
-UserPrincipalName dave@contoso.com `
-Database DB01 `
-Archive `
-ArchiveDatabase ARCHIVE01 `
-Password $password


#example 4:

Disable-Mailbox -Identity dsmith -Archive –Confirm:$false
