#example 1:

New-ManagementRoleAssignment –Role “Mailbox Import Export” `
-User administrator

New-MailboxExportRequest –Mailbox testuser `
–Filepath \\contoso-ex01\export\testuser.pst


#example 2:

New-MailboxExportRequest -Mailbox testuser `
-IncludeFolders "Sent Items" `
-FilePath \\contoso-ex01\export\testuser_sent.pst `
-ExcludeDumpster


#example 3:

New-MailboxExportRequest -Mailbox testuser `
-ContentFilter {Received -lt "09/01/2010"} `
-FilePath \\contoso-ex01\export\testuser_archive.pst `
-ExcludeDumpster `
-IsArchive


#example 4:

Get-MailboxExportRequest -Mailbox testuser -Status Failed


#example 5:

foreach($i in Get-MailboxExportRequest) {
  Get-MailboxExportRequestStatistics $i | 
    select-object SourceAlias,Status,PercentComplete
}


#example 6:

New-MailboxImportRequest -Mailbox sysadmin `
-TargetRootFolder "Recover" `
-FilePath \\contoso-ex01\export\testuser_sent.pst


#example 7:

param($Path, $BatchName)
  foreach($i in Get-Mailbox -ResultSize Unlimited) {
    $filepath = Join-Path -Path $Path -ChildPath "$($i.alias).pst"
    New-MailboxExportRequest -Mailbox $i `
    -FilePath $filepath `
    -BatchName $BatchName
}



$batch = “Export for (Get-Date).ToShortDateString()”
.\Export.ps1 -Path \\contoso\ex01\export -BatchName $batch

Get-MailboxExportRequestStatistics | 
  ?{$_.BatchName -eq “Export for 10/26/2010”} | 
    select SourceAlias,Status,PercentComplete
