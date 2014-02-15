#example 1:

New-SendConnector -Name Internet `
-Usage Internet `
-AddressSpaces 'SMTP:*;1' `
-IsScopedConnector $false `
-DNSRoutingEnabled $false `
-SmartHosts smtp.contoso.com `
-SmartHostAuthMechanism None `
-UseExternalDNSServersEnabled $false `
-SourceTransportServers mb1

New-ReceiveConnector -Name 'Inbound from DMZ' `
-Usage 'Custom' `
-Bindings '192.168.1.245:25' `
-Fqdn mail.contoso.com `
-RemoteIPRanges '172.16.23.0/24' `
-PermissionGroups AnonymousUsers `
-Server cas1


#example 2:

Set-SendConnector -Identity Internet `
-AddressSpaces 'SMTP:*.litwareinc.com;5',
               'SMTP:corp.contoso.com;10'

Get-SendConnector -Identity Internet | Format-List

Set-SendConnector -Identity Internet -Enabled $false

Remove-SendConnector -Identity Internet -Confirm:$false


#example 3:

Set-ReceiveConnector -Identity 'cas1\Inbound from DMZ' `
-Banner '220 SMTP OK' `
-MaxInboundConnection 2500 `
-ConnectionInactivityTimeout '00:02:30'

Get-ReceiveConnector -Identity 'cas1\Inbound from DMZ' | 
  Format-List

Set-ReceiveConnector -Identity 'cas1\Inbound from DMZ' `
-Enabled $false

Remove-ReceiveConnector -Identity 'cas1\Inbound from DMZ' `
-Confirm:$false
