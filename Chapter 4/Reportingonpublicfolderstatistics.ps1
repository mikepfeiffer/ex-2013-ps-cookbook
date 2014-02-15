#example 1:

Get-Mailbox –PublicFolder | Get-MailboxStatistics | ft
DisplayName,TotalItemSize -AutoSize

#example 2:

Get-PublicFolderStatistics | ft Name,ItemCount,TotalItemSize,TotalDeleted
ItemSize,FolderPath,MailboxOwnerId -AutoSize

#example 3:

Get-Mailbox –PublicFolder | Get-MailboxStatistics | Select
DisplayName,TotalItemSize | Export-CSV C:\pf_hierarchy.csv -Notype

#example 4:

Get-PublicFolderStatistics | Select Name,ItemCount,TotalItemSize,TotalDeletedItemSize,FolderPath,MailboxOwnerId | Export-CSV C:\pf.csv -Notype
