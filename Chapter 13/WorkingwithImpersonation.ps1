#example 1:

New-ManagementRoleAssignment -Role ApplicationImpersonation `
-User administrator


#example 2:

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll

$svc = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ExchangeService

$id = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.ImpersonatedUserId `
-ArgumentList "SmtpAddress","dsmith@contoso.com"

$svc.ImpersonatedUserId = $id
$svc.AutoDiscoverUrl(“dsmith@contoso.com”)


#example 3:

function Send-EWSMailMessage {
  param(
  [Parameter(
    Position=0,
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true
  )]
  [String[]]
  $PrimarySmtpAddress,

  [Parameter(
    Position=1, Mandatory=$true
  )]
  [String]
  $From,					

  [Parameter(
    Position=2, Mandatory=$true
  )]
  [String]
  $Subject,

  [Parameter(
    Position=3, Mandatory=$true
  )]
  [String]
  $Body,
  
  [Parameter(
    Position=4, Mandatory=$false
  )]
  [String[]]
  $Cc,
  
  [Parameter(
    Position=5, Mandatory=$false
  )]
  [String[]]
  $Bcc
  
  )

  begin {
    Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
  }

  process {	
    $svc = New-Object `
    -TypeName Microsoft.Exchange.WebServices.Data.ExchangeService
    
    $id = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.ImpersonatedUserId `
    -ArgumentList "SmtpAddress",$From
    
    $svc.ImpersonatedUserId = $id   
    
    $svc.AutodiscoverUrl($From)

    $msg = New-Object `
    -TypeName Microsoft.Exchange.WebServices.Data.EmailMessage `
    -ArgumentList $svc
    
    $msg.Subject = $Subject
    $msg.Body = $Body

    $PrimarySmtpAddress | %{ $msg.ToRecipients.Add($_) | Out-Null }
	
	if ($Cc -ne $null)
	{
		$msg.CcRecipients.Add($Cc) | Out-Null
	}
	
	if ($Bcc -ne $null)
	{
		$msg.BccRecipients.Add($Bcc) | Out-Null
	}

    $msg.SendAndSaveCopy()
  }
}


#example 4:

Send-EWSMailMessage -From sysadmin@contoso.com `
-PrimarySmtpAddress help@contoso.com `
-Subject 'Critical alert on EXCH-MBX-04' `
-Body 'EXCH-MBX-04 Server is low on disk space' `
-Cc administrator@contoso.com `
-Bcc itmanager@contoso.com
