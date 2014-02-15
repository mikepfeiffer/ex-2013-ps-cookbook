#example 1:

New-ManagementRoleAssignment –Role “Mailbox Import Export” `
-User administrator


#example 2:

Search-Mailbox -Identity testuser `
-SearchQuery "subject:'Expense Report'" `
-TargetMailbox restoremailbox `
-TargetFolder "Test Restore" `
-SearchDumpsterOnly


#example 3:

Search-Mailbox -Identity testuser `
-SearchQuery "received:>11/01/2010" `
-TargetMailbox administrator `
-TargetFolder "Testuser Restore" `
-SearchDumpsterOnly
