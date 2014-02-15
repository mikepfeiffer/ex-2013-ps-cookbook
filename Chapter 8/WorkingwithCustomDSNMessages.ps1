#example 1:

New-SystemMessage -DSNCode 5.1.1 `
-Text "The mailbox you tried to send an e-mail message to 
 does not exist. Please contact the Help Desk at extension 
 4112 for assistance." `
-Internal $true `
-Language En


#example 2:

New-SystemMessage -DSNCode 5.1.1 `
-Text "The mailbox you tried to send an e-mail message to 
 does not exist. Please visit the  
 <a href='http://support.contoso.com'>help desk site</a> 
 for assitance" `
-Internal $true `
-Language En


#example 3:

Get-SystemMessage -Original


#example 4:

Set-SystemMessage -Identity 'en\Internal\5.1.1' `
-Text "Sorry, but this recipient is no longer available 
 or does not exist."

 
#example 5:

Remove-SystemMessage -Identity 'en\Internal\5.1.1' -Confirm:$false


#example 6:

New-SystemMessage -QuotaMessageType WarningMailbox `
-Text "Your mailbox is getting too large. Please 
 delete some messages to free up space or call 
 the help desk at extention 3391." `
-Language En
