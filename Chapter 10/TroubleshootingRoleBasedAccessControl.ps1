#example 1:

Get-ManagementRoleAssignment -GetEffectiveUsers | 
  Where-Object {$_.EffectiveUserName -eq 'sysadmin'}


#example 2:

Get-ManagementRoleAssignment -Role 'Legal Hold' -GetEffectiveUsers


#example 3:

Get-ManagementRoleAssignment -WritableRecipient djones `
  -GetEffectiveUsers | 
    Where-Object{$_.EffectiveUserName -eq 'sysadmin'}


#example 4:

Get-RoleGroup 'Organization Management' | Get-RoleGroupMember


#example 5:

foreach($rg in Get-RoleGroup) {
  Get-RoleGroupMember $rg | 
    Select-Object Name,@{n="RoleGroup";e={$rg.Name}}
}
