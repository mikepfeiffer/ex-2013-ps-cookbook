#example 1:

New-MoveRequest –Identity testuser –TargetDatabase DB2


#example 2:

Get-Mailbox -Database DB1 | New-MoveRequest –TargetDatabase DB2


#example 3:

Get-MoveRequest | 
  ?{$_.Status -ne ‘Completed’} | 
    Get-MoveRequestStatistics | 
      select DisplayName,PercentComplete,BytesTransferred

	 
#example 4:

while($true) {
  Get-MoveRequest | ?{$_.Status -ne 'Completed'}
  Start-Sleep 5
  Clear-Host
}


#example 5:

Remove-MoveRequest -Identity testuser -Confirm:$false


#example 6:

Get-MoveRequest | Remove-MoveRequest -Confirm:$false


#example 7:

New-MoveRequest testuser -TargetDatabase DB2


#example 8:

New-MoveRequest testuser -TargetDatabase DB2 -PrimaryOnly


#example 9:

New-MoveRequest testuser -ArchiveOnly -ArchiveTargetDatabase DB2


#example 10:

$mailboxes = Get-Mailbox `
  -RecipientTypeDetails UserMailbox `
  -Database DB1 |
    Get-MailboxStatistics | 
      ?{$_.TotalItemSize -gt 2gb}

$mailboxes | %{
  New-MoveRequest -Identity $_.DisplayName `
  -BatchName 'Large Mailboxes' `
  -TargetDatabase DB2
}

Get-MoveRequest -BatchName ‘Large Mailboxes’


#example 11:

New-MoveRequest -Identity testuser `
-BadItemLimit 100 `
-AcceptLargeDataLoss `
-TargetDatabase DB2
