#example 1:

New-Mailbox -Name "CR23" -DisplayName "Conference Room 23" `
-UserPrincipalName CR23@contoso.com -Room


#example 2:

Set-CalendarProcessing CR23 -AutomateProcessing AutoAccept


#example 3:

Set-CalendarProcessing -Identity CR23 `
-AddAdditionalResponse $true `
-AdditionalResponse 'For Assistance Contact Support at Ext. #3376'


#example 4:

Set-CalendarProcessing -Identity CR23 `
-ResourceDelegates "joe@contoso.com","steve@contoso.com" `
-AutomateProcessing None


#example 5:

Set-ResourceConfig -ResourcePropertySchema 'Room/Whiteboard'

Set-Mailbox -Identity CR23 -ResourceCustom Whiteboard


#example 6:

Get-Mailbox conf* | Set-Mailbox -Type Room
