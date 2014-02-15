#example 1:

Connect-Mailbox -Identity ‘Test User’ `
-Database DB1 `
-User ‘contoso\tuser1009’ `
-Alias tuser1009


#example 2:

Get-MailboxDatabase | 
  Get-MailboxStatistics | 
    ?{$_.DisconnectDate} | 
      fl DisplayName,MailboxGuid,LegacyExchangeDN,DisconnectDate

	  
#example 3:

Get-MailboxDatabase | 
  Get-MailboxStatistics | 
    ?{$_.DisconnectDate -and $_.IsArchiveMailbox -eq $false} | 
      fl DisplayName,MailboxGuid,LegacyExchangeDN,DisconnectDate

	  
#example 4:

function Get-DisconnectedMailbox {
  param(
  [String]$Name = '*',
  [Switch]$Archive
  )
  
  $databases = Get-MailboxDatabase
  $databases  | %{
    $db = Get-Mailboxstatistics -Database $_ | 
      ?{$_.DisconnectDate -and $_.IsArchiveMailbox -eq $Archive}
	
    $db | ?{$_.displayname -like $Name} |
      Select DisplayName,
      MailboxGuid,
      Database,
      DisconnectReason
    }
}


#example 5:

Remove-StoreMailbox -Identity 1c097bde-edec-47df-aa4e-535cbfaa13b4 `
-Database DB1 `
-MailboxState Disabled `
-Confirm:$false


#example 6:

$mb = Get-MailboxDatabase | 
  Get-MailboxStatistics | 
    ?{$_.DisconnectDate}

foreach($i in $mb) {
  Remove-StoreMailbox -Identity $i.MailboxGuid `
  -Database $i.Database `
  -MailboxState $i.DisconnectReason.ToString() `
  -Confirm:$false
}
