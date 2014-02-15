#example 1:

Move-DatabasePath -Identity DB1 `
-EdbFilePath E:\Databases\DB1\DB1.edb `
-LogFolderPath E:\Databases\DB1 `
-Confirm:$false `
-Force


#example 2:

Dismount-Database -Identity DB2 -Confirm:$false


#example 3:

Move-DatabasePath -Identity DB2 `
-EdbFilePath F:\Databases\DB2\DB2.edb `
-LogFolderPath F:\Databases\DB2 `
-ConfigurationOnly `
-Confirm:$false `
-Force

Mount-Database -Identity DB2


#example 4:

foreach($i in Get-MailboxDatabase -Server EX01) {
  $DBName = $i.Name
	
  Move-DatabasePath -Identity $DBName `
  -EdbFilePath "S:\Database\$DBName\$DBName.edb" `
  -LogFolderPath "S:\Database\$DBName" `
  -Confirm:$false `
  -Force	
}
