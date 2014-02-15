#example 1:

Set-Mailbox -Identity dsmith -RetentionHoldEnabled $true

Set-Mailbox -Identity dsmith -RetentionHoldEnabled $false


#example 2:

Set-Mailbox -Identity dsmith `
-RetentionHoldEnabled $true `
–RetentionComment “You are currently on retention hold”


#example 3:

Get-DistributionGroupMember -Identity Marketing | 
  Set-Mailbox -RetentionHoldEnabled $true


#example 4:

Get-Mailbox -Database DB01 | 
  Set-Mailbox -RetentionHoldEnabled $true


#example 5:

Set-Mailbox -Identity dsmith -RetentionHoldEnabled $true `
-StartDateForRetentionHold '1/1/2013 8:00:00 AM' `
-EndDateForRetentionHold '1/30/2013 5:00:00 PM'


#example 6:

Get-Mailbox –ResultSize Unlimited | 
  Where-Object{$_.RetentionHoldEnabled}
