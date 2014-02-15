#example 1:

Set-DistributionGroup -Identity Sales `
-AcceptMessagesOnlyFrom ‘Bob Smith’,’John Jones’


#example 2:

Set-DistributionGroup -Identity Sales `
-AcceptMessagesOnlyFromSendersOrMembers Marketing,bob@contoso.com


#example 3:

get-excommand | ?{$_.parameters.keys -eq 'AcceptMessagesOnlyFrom'}


#example 4:

$finance = Get-Mailbox -Filter {Office -eq 'Finance'}

Set-DistributionGroup -Identity Sales `
-AcceptMessagesOnlyFrom $finance


#example 5:

Set-DistributionGroup -Identity Sales `
-AcceptMessagesOnlyFromSendersOrMembers $null


#example 6:

Set-DistributionGroup -Identity Executives `
-RejectMessagesFromSendersOrMembers HourlyEmployees


#example 7:

Set-DistributionGroup -Identity HelpDesk `
-RequireSenderAuthenticationEnabled $false
