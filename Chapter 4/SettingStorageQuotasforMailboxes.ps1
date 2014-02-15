#example 1:

Set-Mailbox -Identity testuser `
-IssueWarningQuota 1024mb `
-ProhibitSendQuota 1536mb `
-ProhibitSendReceiveQuota 2048mb `
-UseDatabaseQuotaDefaults $false


#example 2:

Get-User -RecipientTypeDetails UserMailbox `
-Filter {Title -eq 'Manager'} | 
  Set-Mailbox -IssueWarningQuota 2048mb `
  -ProhibitSendQuota 2560mb `
  -ProhibitSendReceiveQuota 3072mb `
  -UseDatabaseQuotaDefaults $false
