#example 1:

Get-EventLog -List


#example 2:

Get-EventLog -LogName Application -Source *exch* -EntryType Error


#example 3:

$servers = Get-ClientAccessServer | select -expand name

Get-EventLog -LogName "MSExchange Management" `
-EntryType Error `
-After (Get-Date).AddDays(-7) `
-Newest 10 `
-ComputerName $servers | 
  select MachineName,TimeWritten,EventID,Message | 
    Export-CSV c:\errors.csv -NoTypeInformation  


#example 4:

Get-WinEvent -ListLog *exch* | select LogName


#example 5:

[string]$report = ""
Get-MailboxServer | select -expand Name | Foreach-Object{
  $date = (Get-Date).AddDays(-7)
  $report += Get-WinEvent `
  -LogName Microsoft-Exchange-HighAvailability/Operational `
  -ComputerName $_ |
    Where-Object {($_.LevelDisplayName -eq 'Error') -and `
    ($_.TimeCreated -gt $date)} |
      select MachineName,TimeCreated,Id,ProviderName,Message |
        ConvertTo-Html
  }

Send-MailMessage -To administrator@contoso.com `
-From powershell@contoso.com `
-Subject "Event Log Errors" `
-Body $report `
-BodyAsHtml `
-SmtpServer cas1
