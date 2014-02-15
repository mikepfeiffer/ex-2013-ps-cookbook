#example 1:

$mailboxes = Get-Mailbox -Database DB1
$mailboxes | %{
  New-InboxRule -Name Attach `
  -Mailbox $_ `
  -HasAttachment $true `
  -MarkImportance High
}

#example 2:

foreach($i in Get-Mailbox –Database DB1) {
  New-InboxRule -Name Attach `
  -Mailbox $i `
  -HasAttachment $true `
  -MarkImportance High
}
