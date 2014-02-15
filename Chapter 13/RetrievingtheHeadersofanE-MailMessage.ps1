#example 1:

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService
$svc.AutoDiscoverUrl(“administrator@contoso.com”)

$view = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ItemView `
-ArgumentList 100

$schema = [Microsoft.Exchange.WebServices.Data.ItemSchema]

$propertyset = New-Object –TypeName `
Microsoft.Exchange.WebServices.Data.PropertySet (
  $schema::IdOnly
)

$view.PropertySet = $propertyset

$query = “Subject:’Important Sales Information’”

$items = $svc.FindItems("Inbox",$query,$view)

$items | Foreach-Object{

  $headerview = New-Object -TypeName `
  Microsoft.Exchange.WebServices.Data.ItemView `
  -ArgumentList 1

  $headerprops = New-Object –TypeName `
    Microsoft.Exchange.WebServices.Data.PropertySet (
    $schema::InternetMessageHeaders
  )

  $headerview.PropertySet = $headerprops

  $message = [Microsoft.Exchange.WebServices.Data.Item]::Bind(
    $svc, $_.Id, $headerview.PropertySet
  )

  $message.InternetMessageHeaders
}


#example 2:

Param($query, $mailbox, $folder)

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

$schema = [Microsoft.Exchange.WebServices.Data.ItemSchema]

$propertyset = New-Object –TypeName `
Microsoft.Exchange.WebServices.Data.PropertySet (
  $schema::IdOnly
)

$view.PropertySet = $propertyset

$query = $query

$items = $svc.FindItems($folder,$query,$view)

$items | Foreach-Object{

  $headerview = New-Object -TypeName `
  Microsoft.Exchange.WebServices.Data.ItemView `
  -ArgumentList 1

  $headerprops = New-Object –TypeName `
    Microsoft.Exchange.WebServices.Data.PropertySet (
    $schema::InternetMessageHeaders
  )

  $headerview.PropertySet = $headerprops

  $message = [Microsoft.Exchange.WebServices.Data.Item]::Bind(
    $svc, $_.Id, $headerview.PropertySet
  )

  $message.InternetMessageHeaders
}
