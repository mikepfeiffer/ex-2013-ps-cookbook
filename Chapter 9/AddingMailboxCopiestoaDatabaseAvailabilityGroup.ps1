#example 1:

Add-MailboxDatabaseCopy -Identity DB01 `
-MailboxServer MBX2 `
-ActivationPreference 2


#example 2:

function New-DAGMailboxDatabase {
  param(
    $ActiveServer,
    $PassiveServer,
    $DatabasePrefix,
    $DatabaseCount,
    $EdbFolderPath,
    $LogFolderPath
  )
  
    For ($i=1; $i -le $DatabaseCount; $i++)
    {
        $DBName = $DatabasePrefix + $i
        New-MailboxDatabase -Name $DBName `
        -EdbFilePath "$EdbFolderPath\$DBName\$DBName.edb" `
        -LogFolderPath "$LogFolderPath\$DBName" `
        -Server $ActiveServer

        Mount-Database -Identity $DBName
	
        $PassiveServer | Foreach-Object {
          Add-MailboxDatabaseCopy -Identity $DBName `
          -MailboxServer $_
        }
    }
}

New-DAGMailboxDatabase -ActiveServer mbx1 `
-PassiveServer mbx2,mbx3,mbx4,mbx5 `
-DatabaseCount 3 `
-DatabasePrefix MDB `
-EdbFolderPath E:\Database `
-LogFolderPath E:\Database
