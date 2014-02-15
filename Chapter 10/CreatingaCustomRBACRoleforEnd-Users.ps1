#example 1:

New-ManagementRole -Name MyContactInfo `
-Parent MyContactInformation

$parameters = Get-ManagementRoleEntry "MyContactInfo\Set-User" |
  Select-Object -ExpandProperty parameters

$parameters = $parameters | 
  Where-Object{
    ($_ -ne "Phone") -and `
    ($_ -ne "MobilePhone") -and `
    ($_ -ne "Fax")
  }

Set-ManagementRoleEntry –Identity "MyContactInfo\Set-User" `
-Parameters $parameters

Remove-ManagementRoleAssignment -Identity `
"MyContactInformation-Default Role Assignment Policy" `
-Confirm:$false

New-ManagementRoleAssignment -Role MyContactInfo `
-Policy "Default Role Assignment Policy"


#example 2:

New-RoleAssignmentPolicy -Name MyCustomPolicy `
-Roles MyDistributionGroupMembership,
       MyBaseOptions,
       MyTeamMailboxes,
       MyTextMessaging,
       MyVoiceMail,
       MyContactInfo

Set-Mailbox -Identity "Ramon Shaffer" `
-RoleAssignmentPolicy MyCustomPolicy

Set-RoleAssignmentPolicy MyCustomPolicy -IsDefault

Get-Mailbox -ResultSize Unlimited | 
  Set-Mailbox -RoleAssignmentPolicy MyCustomPolicy
