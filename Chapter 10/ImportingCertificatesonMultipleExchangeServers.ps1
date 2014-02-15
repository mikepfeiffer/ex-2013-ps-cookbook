#example 1:

$password = ConvertTo-SecureString -String P@ssword `
-AsPlainText `
-Force

$cert = Get-ExchangeCertificate `
-DomainName mail.contoso.com -Server cas1 | 
  Export-ExchangeCertificate –BinaryEncoded:$true `
  -Password $password

Import-ExchangeCertificate -FileData $cert.FileData `
-Password $password `
-Server cas2

Get-ExchangeCertificate `
-DomainName mail.contoso.com -Server cas2 | 
  Enable-ExchangeCertificate -Services IIS,SMTP

	
#example 2:

function Deploy-ExchangeCertificate {
  param(
    $SourceServer,
    $Thumbprint,
    $TargetServer,
    $Password,
    $Services
  )

  $password = ConvertTo-SecureString -String $Password `
  -AsPlainText `
  -Force
  
  $cert = Get-ExchangeCertificate -Thumbprint $Thumbprint `
  -Server $SourceServer | 
     Export-ExchangeCertificate –BinaryEncoded:$true `
     -Password $Password  
  
  foreach($Server in $TargetServer) {
    Import-ExchangeCertificate -FileData $cert.FileData `
    -Password $Password `
    -Server $Server

    Enable-ExchangeCertificate -Thumbprint $Thumbprint `
    -Server $Server `
    -Services $Services `
    -Confirm:$false `
    -Force
  }
}

Deploy-ExchangeCertificate -SourceServer cas1 `
-TargetServer cas2,cas3,cas4,cas5,cas6 `
-Thumbprint DE4382508E325D27D2D48033509EE5F9C621A07B `
-Services IIS,SMTP `
-Password P@ssw0rd


#example 3:

$password = ConvertTo-SecureString `
-String P@ssword `
-AsPlainText `
-Force

$file = Get-ExchangeCertificate `
-Thumbprint DE4382508E325D27D2D48033509EE5F9C621A07B –Server cas1 | 
  Export-ExchangeCertificate –BinaryEncoded:$true -Password $password

Set-Content -Path c:\cert.pfx -Value $file.FileData -Encoding Byte


#example 4:

$password = ConvertTo-SecureString `
-String P@ssword `
-AsPlainText `
-Force

$filedata = Get-Content -Path c:\cert.pfx -Encoding Byte -ReadCount 0

Import-ExchangeCertificate -FileData ([Byte[]]$filedata) `
-Password $password `
-Server cas2
