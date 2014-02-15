#example 1:

New-MailboxSearch -Name "InPlace-Hold-dsmith" `
-SourceMailboxes "dsmith@contoso.com" `
-InPlaceHoldEnabled $true

Set-MailboxSearch -Identity "InPlace-Hold-dsmith" `
-InPlaceHoldEnabled $false

Remove-MailboxSearch "InPlace-Hold-dsmith"


#example 2:

Set-Mailbox -Identity dsmith `
–RetentionComment "You are currently on in-place hold, please visit the provided URL" `
–RetentionUrl "http://intranet.contoso.com/in-place-hold/"


#example 3:

Get-Mailbox -ResultSize Unlimited | Where {$_.InPlaceHolds -ne ""}
