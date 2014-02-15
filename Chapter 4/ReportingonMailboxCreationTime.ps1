#example 1:

Get-Mailbox -ResultSize Unlimited | 
  ?{$_.WhenMailboxCreated –ge (Get-Date).AddDays(-7)} | 
    Select DisplayName, WhenMailboxCreated, Database | 
      Export-CSV C:\mb_report.CSV -NoType

	  
#example 2:

Get-Mailbox | ?{$_.WhenMailboxCreated.Month -eq 10}


#example 3:

Get-Mailbox | ?{
  ($_.WhenMailboxCreated.DayOfWeek -eq "Monday") -and `
  ($_.WhenMailboxCreated.Month -eq 10)
}
