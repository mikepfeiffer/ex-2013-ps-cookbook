#example 1:

Get-MailboxServer | 
 Get-LogonStatistics | 
   Select UserName,ApplicationId,ClientVersion,LastAccessTime

   
#example 2:

Get-LogonStatistics -Identity testuser | Format-List *


#example 3:

Get-LogonStatistics -Database DB1
