#example 1:

New-ReceiveConnector -Name Relay `
-Usage Custom `
-Bindings ‘192.168.1.245:25’ `
-Fqdn mail.contoso.com `
-RemoteIPRanges 192.168.1.110 `
-Server CAS1 `
-PermissionGroups ExchangeServers `
-AuthMechanism TLS, ExternalAuthoritative


#example 2:

New-ReceiveConnector -Name Relay `
-Usage Custom `
-Bindings ‘192.168.1.245:25’ `
-Fqdn mail.contoso.com `
-RemoteIPRanges 192.168.1.110 `
-Server CAS1 `
-PermissionGroups AnonymousUsers


#example 3:

Get-ReceiveConnector CAS1\Relay | 
  Add-ADPermission -User "NT AUTHORITY\ANONYMOUS LOGON" `
  -ExtendedRights ms-Exch-SMTP-Accept-Any-Recipient


#example 4:

Set-ContentFilterConfig –BypassedSenders sending-user@contoso.com

Set-ContentFilterConfig –BypassedSenderDomains contoso.com
