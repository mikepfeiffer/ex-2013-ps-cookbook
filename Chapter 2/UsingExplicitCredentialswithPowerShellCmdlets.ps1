#example 1:

$credential = Get-Credential
Get-Mailbox -Credential $credential

#example 2:

$user = "contoso\administrator"
$pass = ConvertTo-SecureString -AsPlainText P@ssw0rd01 -Force
$credential = New-Object System.Management.Automation.PSCredential `
-ArgumentList $user,$pass

#example 3:

$user = Read-Host "Please enter your username"
$pass = Read-Host "Please enter your password" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential `
-ArgumentList $user,$pass
