#example 1:

Get-Mailbox –Identity testuser

#example 2:

Get-Mailbox testuser

#example 3:

Set-Mailbox testuser –MaxSendSize 5mb –MaxReceiveSize 5mb

#example 4:

Set-SendConnector Internet -Enabled $false

#example 5:

Enable-Mailbox testuser -Archive

#example 6:

Remove-Mailbox testuser -Confirm:$false

#example 7:

Set-Mailbox -id testuser –Office Sales
Get-Mailbox -id t*

#example 8:

Get-Mailbox -OrganizationalUnit ‘contoso.com/Sales Users/Phoenix’

$City = ‘Phoenix’
Get-Mailbox -OrganizationalUnit “contoso.com/Sales Users/$City”
