#example 1:

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command ". 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'; Connect-ExchangeServer -auto; c:\Scripts\MoveMailboxes.ps1"

#example 2:

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "$s = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://ex01.contoso.com/PowerShell/; Import-PSSession $s ; c:\Scripts\MoveMailboxes.ps1"
