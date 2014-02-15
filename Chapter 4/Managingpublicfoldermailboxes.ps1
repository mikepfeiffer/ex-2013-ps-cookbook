#example 1:

New-Mailbox –Name PF_Master_Hierarchy –Alias PF_Master_Hierarchy –Database DB1 –OrganizationalUnit "CN=Users,DC=contoso,DC=com" -PublicFolder -Database DB1


#example 2:

New-PublicFolder "Top Folder" -Path "\"
New-PublicFolder "AMER" -Path "\Top Folder"
New-PublicFolder "USA" -Path "\Top Folder\AMER"
New-PublicFolder "Projects" -Path "\Top Folder\AMER\USA"


#example 3:

Enable-MailPublicFolder –Identity "\Top Folder\AMER\USA\Projects"

Set-OrganizationConfig –DefaultPublicFolderIssueWarningQuota 5GB
