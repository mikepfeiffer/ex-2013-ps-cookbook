#example 1:

Add-RoleGroupMember –Identity "Discovery Management" `
-Member administrator

New-ManagementRoleAssignment -Role "Mailbox Search" `
-User administrator

New-MailboxSearch -Name Case1 `
-TargetMailbox "Discovery Search Mailbox" `
-SearchQuery 'Subject:"Corporate Secrets"' `
-StartDate "1/1/2013" `
-EndDate "12/31/2013" `
-MessageTypes Email `
-IncludeUnsearchableItems `
-LogLevel Full


#example 2:

New-MailboxSearch -Name Case2 `
-SourceMailboxes dsmith,jjones `
-TargetMailbox administrator `
-SearchQuery 'Subject:"Corporate Secrets"' `
-MessageTypes Email `
-StatusMailRecipients legal@contoso.com


#example 3:

Get-MailboxSearch | Select-Object Name,Status,Percentcomplete


#example 4:

Stop-MailboxSearch -Identity Case2
Set-MailboxSearch -Identity Case2 -SourceMailboxes Finance,HR
Start-MailboxSearch -Identity Case2
