#example 1:

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType SearchFolder `
-DetectOnly

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType ProvisionedFolder `
-DetectOnly

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType FolderView `
-DetectOnly

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType AggregateCounts `
-DetectOnly


#example 2:

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType SearchFolder

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType ProvisionedFolder

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType FolderView

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType AggregateCounts


#example 3:

Get-Mailbox -OrganizationalUnit "OU=sales,DC=contoso,DC=com" | 
  New-MailboxRepairRequest `
  -CorruptionType SearchFolder `
  –DetectOnly

  
#example 4:

$repair = New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType SearchFolder

Get-EventLog -LogName Application -ComputerName ex01 | ?{
  ('4003','4004','4006','4008','9017','9018' -contains $_.EventID) -and `
  ($_.Message -match $repair.RequestID)
}
