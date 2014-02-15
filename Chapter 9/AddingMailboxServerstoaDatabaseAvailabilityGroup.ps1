#example 1:

Add-DatabaseAvailabilityGroupServer -Identity DAG `
-MailboxServer MBX1


#example 2:

Get-MailboxServer | 
  Add-DatabaseAvailabilityGroupServer -Identity DAG


#example 3:

$mbx = Get-ExchangeServer | Where-Object{
  $_.Site -match 'Default-First-Site-Name' `
  -and $_.ServerRole -match 'Mailbox'
}

$mbx | ForEach-Object{
  Add-DatabaseAvailabilityGroupServer -Identity DAG `
  -MailboxServer $_
}
