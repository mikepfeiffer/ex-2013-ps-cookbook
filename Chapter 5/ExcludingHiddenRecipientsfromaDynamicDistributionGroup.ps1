#example 1:

New-DynamicDistributionGroup -Name TechSupport `
-RecipientContainer contoso.com/TechSupport `
-RecipientFilter {
  HiddenFromAddressListsEnabled -ne $true
}


#example 2:

New-DynamicDistributionGroup -Name Marketing `
-RecipientContainer contoso.com/Marketing `
-RecipientFilter {
  EmailAddresses -like '*marketing*'
}


#example 3:

Set-DynamicDistributionGroup -Identity Marketing `
-RecipientFilter {
  (EmailAddresses -like '*marketing*') -and 
  (HiddenFromAddressListsEnabled -ne $true)
}
