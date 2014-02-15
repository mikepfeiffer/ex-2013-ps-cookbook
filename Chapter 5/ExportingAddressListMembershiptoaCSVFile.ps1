#example 1:

$allusers = Get-AddressList "All Users"
Get-Recipient -RecipientPreviewFilter $allusers.RecipientFilter | 
  Select-Object DisplayName,Database | 
    Export-Csv -Path c:\allusers.csv -NoTypeInformation

	
#example 2:

$allusers = Get-AddressList "All Users"
Get-Recipient -RecipientPreviewFilter $allusers.RecipientFilter | 
  Select-Object DisplayName,
    @{n="EmailAddresses";e={$_.EmailAddresses -join ";"}} | 
      Export-Csv -Path c:\allusers.csv -NoTypeInformation

	  
#example 3:

$GAL = Get-GlobalAddressList "Default Global Address List"
Get-Recipient -RecipientPreviewFilter $GAL.RecipientFilter | 
  Select-Object DisplayName,
    @{n="EmailAddresses";e={$_.EmailAddresses -join ";"}} | 
      Export-Csv -Path c:\GAL.csv -NoTypeInformation
