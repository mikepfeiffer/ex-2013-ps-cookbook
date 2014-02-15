#example 1:

Set-CasMailbox -Identity 'Dave Smith' `
-OWAEnabled $false `
-ActiveSyncEnabled $false `
-PopEnabled $false `
-ImapEnabled $false


#example 2:

Get-Mailbox -Filter {Office -eq 'Sales'} | 
  Set-CasMailbox -OWAEnabled $false `
  -ActiveSyncEnabled $false `
  -PopEnabled $true `
  -ImapEnabled $true

  
#example 3:

Get-Mailbox -RecipientTypeDetails UserMailbox | 
  Set-CasMailbox -OWAEnabled $true `
  -ActiveSyncEnabled $false `
  -PopEnabled $false `
  -ImapEnabled $false `
  -MAPIEnabled $false

  
#example 4:

param(
  $name,
  $password,
  $upn,
  $alias,
  $first,
  $last
)

$pass = ConvertTo-SecureString -AsPlainText $password -Force

$mailbox = New-Mailbox -UserPrincipalName $upn `
-Alias $alias `
-Name "$first $last" `
-Password $pass `
-FirstName $first `
-LastName $last

Set-CasMailbox -Identity $mailbox `
-OWAEnabled $false `
-ActiveSyncEnabled $false `
-PopEnabled $false `
-ImapEnabled $false `
-MAPIBlockOutlookRpcHttp $true
