#example 1:

$DB1 = Get-MailboxDatabase DB1 -Status

if($DB1.DatabaseSize -gt 5gb) {
  "The Database is larger than 5gb"
}

if($DB1.DatabaseSize -gt 5gb) {
  "The Database is larger than 5gb"
}
elseif($DB1.DatabaseSize -gt 10gb) {
  "The Database is larger than 10gb"
}

if($DB1.DatabaseSize -gt 5gb) {
  "The Database is larger than 5gb"
}
elseif($DB1.DatabaseSize -gt 10gb) {
  "The Database is larger than 10gb"
}
else {
  "The Database is not larger than 5gb or 10gb"
}

switch($DB1.DatabaseSize) {
  {$_ -gt 5gb}  {"Larger than 5gb"; break}
  {$_ -gt 10gb} {"Larger than 10gb"; break}
  {$_ -gt 15gb} {"Larger than 15gb"; break}
  {$_ -gt 20gb} {"Larger than 20gb"; break}
  Default       {"Smaller than 5gb"}
}

#example 2:

if((Get-MailboxDatabase DB1 -Status).DatabaseSize -gt 5gb) {
  "The database is larger than 5gb"
}

#example 3:

$number = 3

switch ($number) {
  1 {"One" ; break}
  2 {"Two" ; break}
  3 {"Three" ; break}
  4 {"Four" ; break}
  5 {"Five" ; break}
  Default {"No matches found"}
}

#example 4:

foreach ($mailbox in Get-Mailbox) {
  if($mailbox.office -eq "Sales") {
    Set-Mailbox $mailbox -ProhibitSendReceiveQuota 5gb `
	-UseDatabaseQuotaDefaults $false
  }
  elseif($mailbox.office -eq "Accounting") {
  	Set-Mailbox $mailbox -ProhibitSendReceiveQuota 2gb `
	-UseDatabaseQuotaDefaults $false
  }
  else {
  	Set-Mailbox $mailbox -UseDatabaseQuotaDefaults $true
  }
}
