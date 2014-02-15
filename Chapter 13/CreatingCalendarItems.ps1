#example 1:

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService
$svc.AutoDiscoverUrl(“administrator@contoso.com”)

$appt = New-Object -TypeName `
Microsoft.Exchange.WebServices.Data.Appointment `
-ArgumentList $svc

$appt.Subject = "Review Disk Space Utilization on Server(s)"
$appt.Body = "EXCH-01 has only 40% free disk space on drive c:"

$start = (Get-Date).AddDays(1)
$appt.Start = $start
$appt.End = $start.AddHours(1)

$appt.RequiredAttendees.Add("help@contoso.com")
$appt.RequiredAttendees.Add("sysadmin@contoso.com")

$mode = [Microsoft.Exchange.WebServices.Data.SendInvitationsMode]
$appt.Save($mode::SendToAllAndSaveCopy)


#example 2:

function New-CalendarItem {
  [CmdletBinding()]
  param(
  [Parameter(
    Position=1, Mandatory=$true
  )]
  [String]
  $Subject,
  [Parameter(
    Position=2, Mandatory=$true
  )]
  [String]
  $Body,
  [Parameter(
    Position=3, Mandatory=$true
  )]
  [String]
  $Start,
  [Parameter(
    Position=4, Mandatory=$true
  )]
  [String]
  $End,
  [Parameter(
    Position=5
  )]
  [String[]]
  $RequiredAttendees,
  [Parameter(
    Position=8
  )]
  [String]
  $Mailbox
  )

  begin{
    Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
  }
  
  process {
    $svc = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.ExchangeService
	
    $id = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.ImpersonatedUserId `
    -ArgumentList "SmtpAddress",$Mailbox
    
    $svc.ImpersonatedUserId = $id       
    $svc.AutodiscoverUrl($Mailbox) 
	
    $appt = New-Object -TypeName `
    Microsoft.Exchange.WebServices.Data.Appointment `
    -ArgumentList $svc

    $appt.Subject = $Subject
    $appt.Body = $Body
    $appt.Start = $Start
    $appt.End = $End
	
	if($RequiredAttendees) {
	  $RequiredAttendees | Foreach-Object{
	    $null = $appt.RequiredAttendees.Add($_)
		}
	}
	
    $mode = [Microsoft.Exchange.WebServices.Data.SendInvitationsMode]
    $appt.Save($mode::SendToAllAndSaveCopy)	
  }
}


#example 3:

New-CalendarItem -Subject "Reboot Server" `
-Body "Reboot EXCH-SRV01 server after 5PM today" `
-Start (Get-Date).AddHours(6) `
-End (Get-Date).AddHours(7) `
-Mailbox sysadmin@contoso.com `
-RequiredAttendees help@contoso.com,IT@contoso.com


#example 4:

$start = Get-Date "Monday, February 18, 2013 9:00:00 AM"
$end = $start.AddHours(1)

Get-DistributionGroupMember ITSupport | Foreach-Object{
  New-CalendarItem -Subject "Install Hotfixes" `
  -Body "Start patching servers after 5PM today" `
  -Start $start `
  -End $end `
  -Mailbox $_.PrimarySMTPAddress
}

