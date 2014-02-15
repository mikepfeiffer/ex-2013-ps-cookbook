#example 1:

[byte[]]$data = Get-Content -Path "C:\certificates\ExportedCert.pfx" `
-Encoding Byte `
-ReadCount 0

$password = Get-Credential

Import-ExchangeCertificate -FileData $data -Password $password


#example 2:

Export-RecipientDataProperty -Identity dsmith -Picture | %{ 
  $_.FileData | Add-Content C:\pics\dsmith.jpg -Encoding Byte
}
