#example 1:

Set-Mailbox dsmith -ArchiveQuota 10gb -ArchiveWarningQuota 8gb


#example 2:

Get-Mailbox -Database DB01 | 
  Where-Object {$_.ArchiveName} | 
    Set-Mailbox -ArchiveQuota 10gb -ArchiveWarningQuota 8gb


#example 3:

Get-Mailbox –ResultSize Unlimited | 
  Where-Object {$_.ArchiveName -and $_.ArchiveQuota -ge 50gb} | 
    Set-Mailbox -ArchiveQuota 5gb -ArchiveWarningQuota 4gb
