#example 1:

Send-MailMessage -To user1@contoso.com `
-From administrator@contoso.com `
-Subject "Test E-mail" `
-Body "This is just a test" `
-SmtpServer ex01.contoso.com


#example 2:

Send-MailMessage -To support@contoso.com `
-From powershell@contoso.com `
-Subject "Mailbox Report for $((Get-Date).ToShortDateString())" `
-Body "Please review the attached mailbox report." `
-Attachments c:\report.csv `
-SmtpServer ex01.contoso.com


#example 3:

[string]$report = Get-MailboxDatabase | 
  Get-MailboxStatistics| ?{!$_.DisconnectDate} | 
    Sort-Object TotalItemSize -Desc | 
      Select-Object DisplayName,Database,TotalItemSize -First 10 | 
      ConvertTo-Html

Send-MailMessage -To support@contoso.com `
-From powershell@contoso.com `
-Subject "Mailbox Report for $((Get-Date).ToShortDateString())" `
-Body $report `
-BodyAsHtml `
-SmtpServer ex01.contoso.com
