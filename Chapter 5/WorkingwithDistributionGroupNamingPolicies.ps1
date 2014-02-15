#example 1:

Set-OrganizationConfig -DistributionGroupNamingPolicy `
"DL_<GroupName>"


#example 2:

Set-OrganizationConfig -DistributionGroupNamingPolicy `
"<Department>_<GroupName>_<StateOrProvince>"


#example 3:

Set-OrganizationConfig `
-DistributionGroupNameBlockedWordsList badword1,badword2


#example 4:

Set-OrganizationConfig `
-DistributionGroupDefaultOU "contoso.com/Test"


#example 5:

New-DistributionGroup -Name Accounting -IgnoreNamingPolicy
