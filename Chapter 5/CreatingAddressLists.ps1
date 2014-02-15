#example 1:

New-AddressList -Name 'All Sales Users' `
-RecipientContainer contoso.com/Sales `
-IncludedRecipients MailboxUsers


#example 2:

New-AddressList -Name MobileUsers `
-RecipientContainer contoso.com `
-RecipientFilter {
  HasActiveSyncDevicePartnership -ne $false
}


#example 3:

New-AddressList -Name MobileUsers `
-RecipientContainer contoso.com `
-RecipientFilter {
  (HasActiveSyncDevicePartnership -ne $false) -and 
  (Phone -ne $null)
}

#example 4:

Update-AddressList -Identity "MobileUsers"

Update-AddressList -Identity "All Sales Users"
