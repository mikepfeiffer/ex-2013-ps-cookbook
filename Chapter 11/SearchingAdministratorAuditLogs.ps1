#example 1:

Search-AdminAuditLog -Cmdlets Set-Mailbox `
-StartDate 1/1/2013 `
-EndDate 1/31/2013 `
-IsSuccess $true

New-AdminAuditLogSearch -Name "AdminAuditLogSearch01" `
-Cmdlets Set-Mailbox `
-StartDate 1/1/2013 `
-EndDate 1/31/2013 `
-StatusMailRecipients admin@contoso.com


#example 2:

Search-AdminAuditLog | ?{$_.ObjectModified -like '*douglas*'}


#example 3:

$logs = Search-AdminAuditLog | Select-Object -First 10

$logs[0]

$logs[0].ModifiedProperties | Format-List 
