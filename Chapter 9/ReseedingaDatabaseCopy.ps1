#example 1:

Suspend-MailboxDatabaseCopy -Identity DB01\MBX2 -Confirm:$false

Update-MailboxDatabaseCopy -Identity DB01\MBX2 -DeleteExistingFiles


#example 2:

Update-MailboxDatabaseCopy -Identity DB01\MBX2 `
-DeleteExistingFiles `
-ManualResume


#example 3:

Resume-MailboxDatabaseCopy -Identity DB01\MBX2


#example 4:

Update-MailboxDatabaseCopy -Identity DB01\MBX2 -CatalogOnly


#example 5:

Update-MailboxDatabaseCopy -Identity DB01\MBX2 -DatabaseOnly
