#example 1:

Set-Mailbox dave –HiddenFromAddressListsEnabled $true


#example 2:

Get-Mailbox -Filter {HiddenFromAddressListsEnabled -eq $true}
