#example 1:

Get-MailboxFolderStatistics -Identity testuser -FolderScope All | 
  select Name,ItemsInFolder,FolderSize | 
    Export-CSV C:\MB_Report.csv -NoType

	
#example 2:

function Get-MailboxDeletedItemStats {
  param([string]$id)
  
  $folder = Get-MailboxFolderStatistics $id `
  -FolderScope DeletedItems
  
  $deletedFolder = $folder.FolderSize.ToMb()
  $mb = (Get-MailboxStatistics $id).TotalItemSize.value.ToMb()

  if($deletedFolder -gt 0 -and $mb -gt 0) {
    $percentDeleted = "{0:P0}" -f ($deletedFolder / $mb)
  }
  else {
    $percentDeleted = "{0:P0}" -f 0
  }

  New-Object PSObject -Property @{
    Identity = $id
    MailboxSizeMB = $mb
    DeletedItems = $folder.ItemsInFolder
    DeletedSizeMB = $deletedFolder
    PercentDeleted = $percentDeleted
  }
}


#example 3:

foreach($mailbox in (Get-Mailbox -ResultSize Unlimited)) {
  Get-MailboxDeletedItemStats $mailbox
}
