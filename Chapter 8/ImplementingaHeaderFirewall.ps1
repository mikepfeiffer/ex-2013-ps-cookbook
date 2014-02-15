#example 1:

Remove-ADPermission -Identity "EdgeSync - Litware to Internet" `
-User "MS Exchange\Edge Transport Servers" `
-ExtendedRights Ms-Exch-Send-Headers-Routing `
-Confirm:$false


#example 2:

Remove-ADPermission -Identity Internet `
-User "NT Authority\Anonymous Logon" `
-ExtendedRights Ms-Exch-Send-Headers-Routing `
-Confirm:$false
