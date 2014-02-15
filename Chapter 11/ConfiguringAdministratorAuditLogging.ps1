#example 1:

Get-AdminAuditLogConfig 

Set-AdminAuditLogConfig -AdminAuditLogEnabled $true


#example 2:

Set-AdminAuditLogConfig `
-AdminAuditLogCmdlets Set-Mailbox,Set-CASMailbox


#example 3:

Set-AdminAuditLogConfig -AdminAuditLogExcludedCmdlets New-Mailbox


#example 4:

Set-AdminAuditLogConfig -TestCmdletLoggingEnabled $true


#example 5:

Set-AdminAuditLogConfig -TestCmdletLoggingEnabled $false
