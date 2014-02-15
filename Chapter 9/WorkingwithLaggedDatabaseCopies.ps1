#example 1:

Add-MailboxDatabaseCopy -Identity DB03 `
-MailboxServer mbx2 `
-ReplayLagTime 3.00:00:00

Set-MailboxDatabaseCopy -Identity DB01\mbx2 `
-ReplayLagTime 12:00:00


#example 2:

Set-MailboxDatabaseCopy -Identity DB01\mbx2 `
-ReplayLagTime (New-TimeSpan -Hours 12)


#example 3:

Suspend-MailboxDatabaseCopy -Identity DB01\MBX2 `
-ActivationOnly `
-Confirm:$false
