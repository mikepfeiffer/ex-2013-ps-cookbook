#example 1:

New-ManagementRole -Name "Employee Recipient Creation" `
-Parent "Mail Recipient Creation"

Get-ManagementRoleEntry "Employee Recipient Creation\*" | 
  Where-Object {$_.name -like "remove-*"} | 
    Remove-ManagementRoleEntry -Confirm:$false

New-ManagementScope -Name Employees `
-RecipientRoot contoso.com/Employees `
-RecipientRestrictionFilter {
  (RecipientType -eq "UserMailbox") -or 
  (RecipientType -eq "MailUser") -or 
  (RecipientType -eq "MailContact")
}

New-RoleGroup -Name Support `
-Roles "Employee Recipient Creation" `
-CustomRecipientWriteScope Employees `
-Members bjacobs,dgreen,jgordon
