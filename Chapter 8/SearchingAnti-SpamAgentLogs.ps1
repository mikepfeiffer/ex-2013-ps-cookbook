#example 1:

Get-AgentLog | ?{$_.Agent -eq 'Content Filter Agent'}


#example 2:

Get-AgentLog -StartDate (Get-Date).AddDays(-7) -EndDate (Get-Date)


#example 3:

Get-AgentLog -StartDate "1/2/2013 9:00 AM" -EndDate "1/2/2013 11:00 PM"


#example 4:

Get-AgentLog -StartDate (Get-Date).AddDays(-7) -EndDate (Get-Date) |
  ?{$_.Agent -eq 'Sender Filter Agent'}

  
#example 5:

Get-AgentLog | 
  ?{$_.P1FromAddress -or $_.P2FromAddress -eq 'sales@litwareinc.com'}

  
#example 6:

Get-AgentLog | 
  ?{$_.P1FromAddress -or $_.P2FromAddress -like '*@litwareinc.com'}

  
#example 7:

Get-AgentLog | ?{$_.Recipients -eq 'dsmith@contoso.com'}


#example 8:

Get-AgentLog -StartDate (Get-Date).AddDays(-3) -EndDate (Get-Date) |
  ?{$_.Agent -eq 'Content Filter Agent' -and $_.ReasonData -gt 4} |
    Export-CSV c:\contentfilter.csv -NoType

	 
#example 9:

Get-AgentLog -Location e:\logs
