#example 1:

Get-Mailbox | Select-Object Name,Alias | Out-File c:\report.txt

#example 2:

Get-Mailbox | Select-Object Name,Alias | 
  Export-CSV c:\report.csv –NoType

#example 3:

Get-Mailbox | 
  Select-Object Name,@{n="Email";e={$_.EmailAddresses -Join ";"}} | 
    Export-CSV c:\report.csv -NoType

#example 4:

Get-Mailbox | 
  select-Object Name,
    @{n="Email";
      e={($_.EmailAddresses | %{$_.SmtpAddress}) -Join ";"}
     } | Export-CSV c:\report.csv -NoType
