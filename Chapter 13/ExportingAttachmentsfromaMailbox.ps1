#example 1:

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService
$svc.AutoDiscoverUrl(“administrator@contoso.com”)

$view = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ItemView `
-ArgumentList 100

$base = [Microsoft.Exchange.WebServices.Data.BasePropertySet]

$propertyset = New-Object –TypeName `
Microsoft.Exchange.WebServices.Data.PropertySet (
  $base::FirstClassProperties
)

$view.PropertySet = $propertyset

$query = “Attachment:docx”

$items = $svc.FindItems("Inbox",$query,$view)

$items | ForEach-Object{
  if($_.HasAttachments  ) {
    $_.Load()
    $_.Attachments | ForEach-Object {
      $_.Load()
      $filename = $_.Name
      Set-Content -Path c:\export\$filename `
      -Value $_.Content `
      -Encoding Byte `
      -Force
    }
  }
}


#example 2:

Param($folder, $query, $path, $mailbox)

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService

$id = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ImpersonatedUserId `
-ArgumentList "SmtpAddress",$mailbox

$svc.ImpersonatedUserId = $id
$svc.AutoDiscoverUrl($mailbox)

$view = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ItemView `
-ArgumentList 100

$base = [Microsoft.Exchange.WebServices.Data.BasePropertySet]

$propertyset = New-Object –TypeName `
Microsoft.Exchange.WebServices.Data.PropertySet (
  $base::FirstClassProperties
)

$view.PropertySet = $propertyset

$items = $svc.FindItems($folder,$query,$view)

$items | Foreach-Object{
  if($_.HasAttachments) {
    $_.Load()
    $_.Attachments | ForEach-Object {
      $_.Load()
      $filename = $_.Name

      Set-Content -Path $path\$filename `
      -Value $_.Content `
      -Encoding Byte `
      -Force
    }
  }
}


#example 3:

c:\AttachmentExport.ps1 -folder inbox `
-mailbox sysadmin@contoso.com `
-query "attachment:xls" `
-path c:\Attachments


#example 4:

c:\AttachmentExport.ps1 -folder inbox `
-mailbox sysadmin@contoso.com `
-query "attachment:*" `
-path c:\Attachments
