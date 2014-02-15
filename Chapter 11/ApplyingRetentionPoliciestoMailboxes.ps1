#example 1:

Set-Mailbox dsmith -RetentionPolicy AllUsers

Get-Mailbox -RecipientTypeDetails UserMailbox | 
  Set-Mailbox -RetentionPolicy AllUsers


#example 2:

Get-Mailbox -RecipientTypeDetails UserMailbox | 
  Where-Object {$_.RetentionPolicy -eq $null} | 
    Set-Mailbox -RetentionPolicy AllUsers


#example 3:

Start-ManagedFolderAssistant -Identity dsmith@contoso.com


#example 4:

Get-Mailbox -Database DB01 | Start-ManagedFolderAssistant
