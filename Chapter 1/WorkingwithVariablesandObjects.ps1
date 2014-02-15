#example 1:

$mailbox = Get-Mailbox testuser

#example 2:

$email = “testuser@contoso.com”
$email.length
$email.Split("@")

#example 3:

$mailbox | Get-Member
$mailbox.MaxSendSize
$mailbox.MaxSendSize.Value
$mailbox.MaxSendSize.Value | Get-Member -MemberType Method
$mailbox.MaxSendSize.Value.ToMB()

#example 4:

$name = "Bob"
"The user name is $name"

#example 5:

$mailbox = Get-Mailbox testuser
"The email address is $mailbox.PrimarySmtpAddress"
"The email address is $($mailbox.PrimarySmtpAddress)"

#example 6:

$var1 = 32
$var1.GetType()

[string]$var2 = 32
$var2.GetType()
