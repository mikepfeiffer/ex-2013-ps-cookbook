#example 1:

Get-Mailbox -Filter {Office -eq 'Sales'}


#example 2:

New-DynamicDistributionGroup -Name DL_Accounting `
-RecipientFilter {
  (Department -eq 'Accounting') -and 
  (RecipientType -eq 'UserMailbox')
}


#example 3:

Get-Mailbox | ?{$_.Office -eq ‘Sales’}


#example 4:

get-excommand | ?{$_.parameters.keys -eq 'filter'}


#example 5:

get-excommand | ?{$_.parameters.keys -eq 'recipientfilter'}


#example 6:

New-DynamicDistributionGroup -Name DL_Accounting `
-IncludedRecipients MailboxUsers `
-ConditionalDepartment Accounting


#example 7:

$office = "sales"
Get-Mailbox -Filter {Office -eq $office}

$office = "sales"
Get-Mailbox -Filter "Office -eq '$office'"
