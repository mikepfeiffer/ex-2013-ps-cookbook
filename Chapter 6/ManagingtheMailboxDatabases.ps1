#example 1:

New-MailboxDatabase -Name DB4 `
-EdbFilePath E:\Databases\DB4\DB4.edb `
-LogFolderPath E:\Databases\DB4 `
-Server EX01

Mount-Database -Identity DB4

Set-MailboxDatabase -Identity DB4 -Name Database4

Remove-MailboxDatabase -Identity Database4 -Confirm:$false


#example 2:

New-MailboxDatabase -Name DB10 -Server EX01 | Mount-Database


#example 3:

Set-MailboxDatabase -Identity DB1 -IsExcludedFromProvisioning $true


#example 4:

$data = Import-CSV .\DBs.csv
foreach ($row in $data) {
  $DBName = $row.DBName
  $LogPath = 'E:\' + $DBName + '\Logs'
  $DBPath = 'E:\' + $DBName + '\Database\' + $DBName + '.edb'
  $Server = $row.Server

New-MailboxDatabase -Name $DBName -Server $Server -Edbfilepath $DBPath `
-Logfolderpath $LogPath
}
foreach ($row in $data) {
  $DBName = $row.DBName
  Mount-Database $DBName
}
