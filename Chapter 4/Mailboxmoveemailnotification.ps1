#example 1:

New-MigrationBatch –Name Batch01 –CSVData ([System.IO.File]::ReadAllBytes("C:\localmove.csv")) –Local –TargetDatabase DB02 -NotificationEmails 'administrator@contoso.com','jonand@contoso.com' -AutoStart

Get-MigrationUser | Get-MigrationUserStatistics | ft -AutoSize

Complete-MigrationBatch -Identity Batch01

#example 2:

New-MigrationBatch –Name Batch01 –CSVData ([System.IO.File]::ReadAllBytes("C:\localmove.csv")) –Local –TargetDatabase DB02 -NotificationEmails 'administrator@contoso.com','testuser@contoso.com' -AutoStart -AutoComplete
