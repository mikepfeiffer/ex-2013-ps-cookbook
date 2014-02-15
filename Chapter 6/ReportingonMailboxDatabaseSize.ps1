#example 1:

Get-MailboxDatabase -Status | select-object Name,DatabaseSize


#example 2:

Get-MailboxDatabase -Status | 
  select-object Name,Server,DatabaseSize,Mounted | 
    Export-CSV –Path c:\databasereport.csv -NoTypeInformation

	
#example 3:

Get-MailboxDatabase -Status | 
  Select-Object Name,
    @{n="DatabaseSize";e={$_.DatabaseSize.ToMb()}}
