#example 1:

New-MailboxDatabase -Name RecoveryDB `
-EdbFilePath E:\Recovery\DB1\DB1.edb `
-LogFolderPath E:\Recovery\DB01 `
-Recovery `
-Server MBX1


#example 2:

eseutil /mh .\DB1.edb
eseutil /R E02 /D
Mount-Database -Identity RecoveryDB


#example 3:

Get-MailboxStatistics -Database RecoveryDB | fl DisplayName,MailboxGUID,LegacyDN


#example 4:

New-MailboxRestoreRequest -SourceDatabase RecoveryDB `
-SourceStoreMailbox "Joe Smith" `
-TargetMailbox joe.smith


#example 5:

$mailboxes = Get-MailboxStatistics -Database RecoveryDB
foreach($mailbox in $mailboxes) {
  New-MailboxRestoreRequest -SourceDatabase RecoveryDB `
  -SourceStoreMailbox $mailbox.DisplayName `
  -TargetMailbox $mailbox.DisplayName  
}
