#example 1:

$cert = New-ExchangeCertificate -GenerateRequest `
-SubjectName “c=US, o=Contoso, cn=mail.contoso.com” `
-DomainName autodiscover.contoso.com,mail.contoso.com `
-PrivateKeyExportable $true

$cert | Out-File c:\cert_request.txt
