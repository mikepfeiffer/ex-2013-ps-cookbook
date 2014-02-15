#example 1:

New-ManagementRoleAssignment –Role “Mailbox Import Export” `
-User administrator


#example 2:

Search-Mailbox -Identity testuser `
-SearchQuery "Subject:'Your mailbox is full'" `
-DeleteContent `
-Force


#example 3:

Search-Mailbox -Identity testuser `
-SearchQuery "Subject:'free ipad'" `
-DoNotIncludeArchive `
-SearchDumpster:$false `
-DeleteContent `
-Force


#example 4:

Get-Mailbox | 
  Search-Mailbox -SearchQuery "from:spammer@contoso.com" `
  -EstimateResultOnly | Export-CSV C:\report.csv -NoType

	  
#example 5:

Search-Mailbox -Identity testuser `
-SearchQuery "Subject:'Accounting Reports'" `
-TargetMailbox sysadmin `
-TargetFolder "Delete Log" `
-LogOnly `
-LogLevel Full


#example 6:

Get-Mailbox -ResultSize Unlimited | 
  Search-Mailbox -SearchQuery 'from:spammer@contoso.com' `
  -DeleteContent -Force
