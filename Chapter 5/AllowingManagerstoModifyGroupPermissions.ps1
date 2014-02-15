#example 1:

New-ManagementRoleAssignment -Role MyDistributionGroups `
-Policy "Default Role Assignment Policy"

Set-DistributionGroup Sales -ManagedBy bobsmith


#example 2:

New-ManagementRole -Name MyDGCustom -Parent MyDistributionGroups

Remove-ManagementRoleEntry MyDGCustom\New-DistributionGroup
Remove-ManagementRoleEntry MyDGCustom\Remove-DistributionGroup

New-ManagementRoleAssignment -Role MyDGCustom `
-Policy "Default Role Assignment Policy"
