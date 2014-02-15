#example 1:

Get-MailboxAutoReplyConfiguration dave


#example 2:

Set-MailboxAutoReplyConfiguration dave -AutoReplyState Disabled


#example 3:

Set-MailboxAutoReplyConfiguration dave `
-AutoReplyState Scheduled `
-StartTime 2/11/2013 `
-EndTime 2/17/2013 `
-ExternalMessage "I will be out of the office this week"


#example 4:

Set-MailboxAutoReplyConfiguration dave `
-ExternalMessage (Get-Content C:\oof.html)


#example 5:

Get-Mailbox –ResultSize Unlimited | 
  Get-MailboxAutoReplyConfiguration | 
    ?{$_.AutoReplyState -ne "Disabled"} | 
	  Select Identity,AutoReplyState,StartTime,EndTime
