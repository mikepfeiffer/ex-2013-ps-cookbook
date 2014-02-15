#example 1:

Get-MailboxDatabase | Get-MailboxStatistics | 
  ?{!$_.DisconnectDate} | 
    Select-Object DisplayName,TotalItemSize

	
#example 2:

Get-MailboxDatabase | Get-MailboxStatistics | 
  ?{!$_.DisconnectDate} | 
    Select-Object DisplayName,TotalItemSize | 
      Export-CSV c:\mbreport.csv -NoType

	  
#example 3:

Get-MailboxDatabase | Get-MailboxStatistics | 
  ?{!$_.DisconnectDate} | 
    Select-Object DisplayName,
    @{n="SizeMB";e={$_.TotalItemSize.value.ToMb()}} | 
      Sort-Object SizeMB -Desc
