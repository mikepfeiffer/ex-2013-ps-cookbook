#example 1:

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService
$svc.AutoDiscoverUrl(“administrator@contoso.com”)

$view = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ItemView `
-ArgumentList 100

$propertyset = New-Object Microsoft.Exchange.WebServices.Data.PropertySet (
  [Microsoft.Exchange.WebServices.Data.BasePropertySet]::IdOnly
)

$view.PropertySet = $propertyset

$query = “Body:’inappropriate content’”

$items = $svc.FindItems("Inbox",$query,$view)

$items | Foreach-Object{
  $message = [Microsoft.Exchange.WebServices.Data.Item]::Bind(
    $svc, $_.Id
  )

  $message.Delete("SoftDelete")
}


#example 2:

function Remove-MailboxItem {
  [CmdletBinding(
    SupportsShouldProcess = $true, ConfirmImpact = "High"
  )]
  param(
    [Parameter(
      Position=0,
      Mandatory=$true,
      ValueFromPipelineByPropertyName=$true
    )]
    [String]
    $PrimarySmtpAddress,
	
    [Parameter(
      Position = 1, Mandatory = $true
    )]
    [String]
    $SearchQuery,
	
    [Parameter(
      Position = 2, Mandatory = $false
    )]
    [int]
    $ResultSize = 100, 
	
    [Parameter(
      Position = 3, Mandatory = $false
    )]
    [string]
    $Folder = "Inbox",
	
    [Parameter(
      Position = 4, Mandatory = $false
    )]
    [ValidateSet(
     'HardDelete',
     'SoftDelete',
     'MoveToDeletedItems'
    )]
    $DeleteMode = "MoveToDeletedItems"	
  )
  
  begin {
    Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
  }
  
  process {
    $svc = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.ExchangeService
	
    $id = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.ImpersonatedUserId `
    -ArgumentList "SmtpAddress",$PrimarySmtpAddress

    $svc.ImpersonatedUserId = $id
    $svc.AutoDiscoverUrl($PrimarySmtpAddress)

    $view = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.ItemView `
    -ArgumentList 100

    $propertyset = New-Object –TypeName `
    Microsoft.Exchange.WebServices.Data.PropertySet (
      [Microsoft.Exchange.WebServices.Data.BasePropertySet]::IdOnly
    )

    $view.PropertySet = $propertyset
	
    $items = $svc.FindItems($Folder,$SearchQuery,$view)

    $items | %{
      $message = [Microsoft.Exchange.WebServices.Data.Item]::Bind(
        $svc, $_.Id
      )

      if ($pscmdlet.ShouldProcess($message.Subject)) {
    	$message.Delete($DeleteMode)
      }
    }	
  }
}


#example 3:

Get-Mailbox -ResultSize unlimited | 
  Remove-MailboxItem -SearchQuery "body:'free ipad'" `
  -DeleteMode HardDelete `


#example 4:

Remove-MailboxItem -PrimarySmtpAddress sysadmin@contoso.com `
-SearchQuery "body:'buy cheap drugs'" `
-DeleteMode HardDelete `
-Confirm:$false


#example 5:

Remove-MailboxItem -PrimarySmtpAddress sysadmin@contoso.com `
-SearchQuery "body:'buy cheap drugs'" `
-DeleteMode HardDelete `
-Whatif
