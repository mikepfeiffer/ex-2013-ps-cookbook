#example 1:

Set-OwaVirtualDirectory -Identity 'CAS1\owa (Default Web Site)' `
-ExternalUrl https://mail.contoso.com/owa


#example 2:

Get-OwaVirtualDirectory -Server cas1 | fl ExternalUrl


#example 3:

Set-EcpVirtualDirectory -Identity 'CAS1\ecp (Default Web Site)' `
-ExternalUrl https://mail.contoso.com/ecp


#example 4:

Get-EcpVirtualDirectory -Server cas1 | 
  Set-EcpVirtualDirectory -ExternalUrl https://mail.contoso.com/ecp

  
#example 5:

Set-ClientAccessServer -Identity cas1 `
-AutoDiscoverServiceInternalUri `
https://mail.contoso.com/Autodiscover/Autodiscover.xml


#example 6:

Set-OABVirtualDirectory -Identity "cas1\oab (Default Web Site)" `
-ExternalUrl https://mail.contoso.com/oab


#example 7:

Set-ActivesyncVirtualDirectory -Identity `
"cas1\Microsoft-Server-ActiveSync (Default Web Site)" `
-ExternalURL https://mail.contoso.com/Microsoft-Server-Activesync


#example 7:

Set-WebServicesVirtualDirectory -Identity `
"cas1\EWS (Default Web Site)" `
-ExternalUrl https://mail.contoso.com/ews/exchange.asmx
