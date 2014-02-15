#example 1:

$servers = "EX1","EX2","EX3"

$hashtable = @{}
$hashtable["server1"] = 1
$hashtable["server2"] = 2
$hashtable["server3"] = 3

#example 2:

$hashtable = @{server1 = 1; server2 = 2; server3 = 3}

#example 3:

$hashtable = @{
  server1 = 1
  server2 = 2
  server3 = 3
}

#example 4:

$parameters = @{
  Title = "Manager"
  Department = "Sales"
  Office = "Headquarters"
}

Set-User testuser @parameters

#example 5:

$mailbox = Get-Mailbox testuser
$mailbox.EmailAddresses += “testuser@contoso.com”
Set-Mailbox testuser -EmailAddresses $mailbox.EmailAddresses

$mailbox.EmailAddresses -= “testuser@contoso.com”
Set-Mailbox testuser -EmailAddresses $mailbox.EmailAddresses
