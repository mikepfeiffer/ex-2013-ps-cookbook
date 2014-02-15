#example 1:

Add-RoleGroupMember -Identity "Server Management" -Member bwelch


#example 2:

Get-ManagementRoleAssignment -RoleAssignee 'Server Management' | 
  Select-Object Role


#example 3:

Get-ManagementRoleEntry 'Exchange Server\*'
  
Get-ManagementRoleEntry *\Get-Mailbox
  
  
#example 4:

New-ManagementRoleAssignment -Role ‘Mailbox Import Export’ `
-User administrator

New-ManagementRoleAssignment -Role ‘Mailbox Import Export’ `
-SecurityGroup GroupName


#example 5:

Get-RoleAssignmentPolicy "Default Role Assignment Policy" | 
  Format-List AssignedRoles
