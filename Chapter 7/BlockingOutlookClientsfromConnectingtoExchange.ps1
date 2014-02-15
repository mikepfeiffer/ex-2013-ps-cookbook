#example 1:

Set-CASMailbox -Identity dsmith -MAPIBlockOutlookRpcHttp $true

Set-CASMailbox -Identity dsmith -MAPIBlockOutlookNonCachedMode $true

Get-CASMailbox -Resultsize Unlimited | 
  Set-CASMailbox -MAPIBlockOutlookVersions '-11.9.9'

Get-CASMailbox -ResultSize Unlimited | ?{$_.MAPIBlockOutlookVersions}

Set-CASMailbox dsmith -MAPIBlockOutlookVersions $null

Get-CASMailbox -ResultSize Unlimited | 
  Set-CASMailbox -MAPIBlockOutlookVersions $null

  
#example 2:

Get-CASMailbox | Where-Object{$_.MAPIBlockOutlookNonCachedMode}

Get-CASMailbox | Where-Object{$_.MAPIBlockOutlookRpcHttp}


Get-CASMailbox -OrganizationalUnit contoso.com/Sales | 
  Set-CASMailbox -MAPIBlockOutlookRpcHttp $true

Get-CASMailbox -OrganizationalUnit contoso.com/Sales | 
  Set-CASMailbox -MAPIBlockOutlookRpcHttp $false

  
#example 3:

Set-CASMailbox dsmith -MAPIBlockOutlookVersions '-5.9.9;7.0.0-11.9.9'

Set-RpcClientAccess -Server cas1 `
-BlockedClientVersions '-5.9.9;7.0.0-13.9.9'
