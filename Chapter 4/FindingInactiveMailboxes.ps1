#example 1:

$mailboxes = Get-Mailbox -ResultSize Unlimited
$mailboxes | ?{
  (Get-MailboxStatistics $_).LastLogonTime -and `
  (Get-MailboxStatistics $_).LastLogonTime -le `
  (Get-Date).AddDays(-90)
}


#example 2:

Get-User -RecipientTypeDetails UserMailbox | 
  ?{$_.UserAccountControl -match 'AccountDisabled'}
