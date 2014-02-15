#example 1:

Get-MailboxPermission -Identity administrator | 
  Where-Object {$_.AccessRights -like "*FullAccess*"}

  
#example 2:

Get-MailboxPermission administrator | 
  Where-Object {
    ($_.AccessRights -like "*FullAccess*") `
    -and ($_.User -notlike "NT AUTHORITY\SELF") `
    -and ($_.IsInherited -eq $false)
  }

  
#example 3:

foreach($mailbox in Get-Mailbox -ResultSize Unlimited) {
  Get-MailboxPermission $mailbox | 
    Where-Object {
      ($_.AccessRights -like "*FullAccess*") `
      -and ($_.User -notlike "NT AUTHORITY\SELF") `
      -and ($_.IsInherited -eq $false)
    }
}
