#example 1:

Add-ADPermission -Identity "Frank Howe" `
-User "Eric Cook" `
-ExtendedRights Send-As


#example 2:

Get-Mailbox fhowe | 
  Add-ADPermission -User ecook -ExtendedRights Send-As

  
#example 3:

Get-Mailbox -OrganizationalUnit contoso.com/Sales | 
  Add-ADPermission -User ecook -ExtendedRights Send-As

  
#example 4:

Remove-ADPermission -Identity "Frank Howe" `
-User ecook `
-ExtendedRights Send-As `
-Confirm:$false


#example 5:

Add-ADPermission -Identity Marketing `
-User ecook `
-ExtendedRights Send-As


#example 6:

Get-DistributionGroup -ResultSize Unlimited | 
  Add-ADPermission -User ecook -ExtendedRights Send-As
