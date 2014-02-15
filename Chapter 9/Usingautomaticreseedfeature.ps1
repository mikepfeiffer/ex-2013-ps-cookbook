Configure the DAG by using:
Set-DatabaseAvailabilityGroup DAG -AutoDagDatabasesRootFolderPath "C:\ExDbs"
Set-DatabaseAvailabilityGroup DAG -AutoDagVolumesRootFolderPath "C:\ExVols"
Set-DatabaseAvailabilityGroup DAG -AutoDagDatabaseCopiesPerVolume 1


Verify the configurion of the DAG:
Get-DatabaseAvailabilityGroup DAG | Format-List *auto*


Create the folder structure by using the command:
md C:\ExDBs
md C:\ExDBs\DB01
md C:\ExVols
md C:\ExVols\Volume1
md C:\ExVols\Volume2


Verify the folder structure by using the command:
dir C:\ExDBs /s
dir C:\ExVols /s


Mount the volumes into folders/mountpoints:
Mountvol.exe C:\ExDBs\DB01 \\?\Volume{43895ac2-a485-11e2-93f5-000c2997a8b3}\
Mountvol.exe C:\ExVols\Volume01 \\?\Volume{43895ac2-a485-11e2-93f5-000c2997a8b3}\
Mountvol.exe C:\ExVols\Volume02 \\?\Volume{43895ad2-a485-11e2-93f5-000c2997a8b3}\


Verify the configuration:
Mountvol.exe C:\ExDBs\DB01 /L
Mountvol.exe C:\ExVols\Volume01 /L
Mountvol.exe C:\ExVols\Volume02 /L


Create the folder structure:
md C:\ExVols\Volume01\DB01.db
md C:\ExVols\Volume01\DB01.log


Verify the folder structure:
dir C:\ExDBs /s
dir C:\ExVols /s


Create a new database:
New-MailboxDatabase -Name DB01 -Server TLEX01 -EdbFilePath C:\ExDBs\DB01\DB01.db\DB01.edb -LogFolderPath C:\ExDBs\DB01\DB01.log


Add a database copy:
Add-MailboxDatabaseCopy -Identity DB01 -MailboxServer TLEX02 -ActivationPreference 2
