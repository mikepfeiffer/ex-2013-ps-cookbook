#example 1:

Get-PublicFolder -Recurse | Get-PublicFolderClientPermission

Remove-PublicFolderClientPermission -Identity "\" -User Default
Remove-PublicFolderClientPermission -Identity "\Top Folder" -User Default

Add-PublicFolderClientPermission -Identity "\" -User Default -AccessRights Reviewer
Add-PublicFolderClientPermission -Identity "\Top Folder" -User Default -AccessRights Reviewer


#example 2:

Add-PublicFolderClientPermission -Identity "\Top Folder" -User "PF_Top Folder_Owner" -AccessRights Owner
Add-PublicFolderClientPermission -Identity "\Top Folder\AMER\USA\Projects" -User "PF_AMER_USA_Projects_Owner" -AccessRights Owner
