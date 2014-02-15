#example 1:

$certificate = Get-Content -Path c:\certnew.cer `
-Encoding Byte `
-ReadCount 0

Import-ExchangeCertificate -FileData $certificate

Get-ExchangeCertificate -DomainName mail.contoso.com | 
  Enable-ExchangeCertificate -Services IIS,SMTP


#example 2:

Enable-ExchangeCertificate `
-Thumbprint CF61E66A6BE1A286471B30DFCEA1126F6BC7DCBB `
-Services IIS,SMTP
