#example 1:

function Get-MailboxList {
  param($name)
  Get-Mailbox $name | fl Name,Alias,ServerName
}

#example 2:

function Get-MailboxName {
  process {
    "Mailbox Name: $($_.Name)"
  }
}

Get-Mailbox -Database DB1 | Get-MailboxName

#example 3:

function Set-SendReceiveQuota {
 param(
   [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
   $name,
   [Parameter(Mandatory=$true)]
   $quota
  )

  begin {
    $count = 0
    Write-Output "Started: $(Get-Date -format T)"
  }
	
  process {
    $count += 1
    $mailboxstatistics = Get-MailboxStatistics $name
    $total = $mailboxstatistics.TotalItemSize.Value.ToMB()
    if($total -lt $quota) {
	  Set-Mailbox $name -ProhibitSendReceiveQuota $quota `
	  -UseDatabaseQuotaDefaults $false
    }
  }
	
  end {
    Write-Output "Ended: $(Get-Date -format T)"
    Write-Output "Mailboxes Processed: $count"
  }
}
