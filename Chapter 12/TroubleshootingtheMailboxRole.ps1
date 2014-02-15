#example 1:

Test-MAPIConnectivity -Database DB1


#example 2:

Test-MAPIConnectivity -Identity administrator


#example 3:

Test-MAPIConnectivity -Server MBX1


#example 4:

Test-MRSHealth -Identity MBX1


#example 5:

Get-MailboxServer | Test-MAPIConnectivity
