#example 1:

Set-OutlookAnywhere -Identity 'CAS1\Rpc (Default Web Site)' `
-ExternalHostname mail.contoso.com `
-ExternalClientsRequireSsl $true `
-InternalHostname mail.contoso.com `
-InternalClientsRequireSsl $true `
-ExternalClientAuthenticationMethod Basic `
-InternalClientAuthenticationMethod Ntlm `
-SSLOffloading $false


#example 2:

Get-OutlookAnywhere | fl ServerName,ExternalHostname,InternalHostname


#example 3:

Set-OutlookAnywhere -Identity 'CAS1\Rpc (Default Web Site)' `
-ExternalHostname 'outlook.contoso.com'
