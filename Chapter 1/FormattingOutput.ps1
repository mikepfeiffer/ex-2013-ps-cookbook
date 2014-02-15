#example 1:

Get-Mailbox testuser | Format-List
Get-Mailbox testuser | Format-Table name,alias

#example 2:

Get-Mailbox testuser | fl * | Out-File c:\mb.txt
Get-MailboxDatabase | sort name | ft name
Get-MailboxDatabase | sort name -desc | ft name
