#example 1:

Test-Mailflow -Identity MBX1 -TargetMailboxServer MBX2


#example 2:

Test-Mailflow -Identity MBX1 -TargetEmailAddress dsmith@contoso.com


#example 3:

Test-SmtpConnectivity -Identity MBX2


#example 4:

Get-TransportService | Test-SmtpConnectivity
