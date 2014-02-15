#example 1:

$groups = Get-DistributionGroup -ResultSize Unlimited

foreach($group in $groups){
  Get-DistributionGroupMember $group | 
    ?{$_.RecipientType -like '*User*' -and $_.ResourceType -eq $null} | 
      Get-User | ?{$_.UserAccountControl -match 'AccountDisabled'} | 
        Remove-DistributionGroupMember $group -Confirm:$false
}


#example 2:

$groups = Get-DistributionGroup -ResultSize Unlimited

$report = foreach($group in $groups){
  Get-DistributionGroupMember $group | 
    ?{$_.RecipientType -like '*User*' -and $_.ResourceType -eq $null} | 
      Get-User | ?{$_.UserAccountControl -match 'AccountDisabled'} | 
        Select-Object Name,RecipientType,@{n='Group';e={$group}}
}

$report | Export-CSV c:\disabled_group_members.csv -NoType
