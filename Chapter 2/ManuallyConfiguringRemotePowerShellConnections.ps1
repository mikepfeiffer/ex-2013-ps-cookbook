#example 1:

$credential = Get-Credential

$session = New-PSSession -ConfigurationName Microsoft.Exchange `
-ConnectionUri http://mail.contoso.com/PowerShell/ `
-Credential $credential

Import-PSSession $session

#example 2:

$session = New-PSSession -ConfigurationName Microsoft.Exchange `
-ConnectionUri http://mail.contoso.com/PowerShell/

Import-PSSession $session
