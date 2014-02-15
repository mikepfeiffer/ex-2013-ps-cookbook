#example 1:

Set-DistributionGroup -Identity Executives `
-ModerationEnabled $true `
-ModeratedBy administrator `
-SendModerationNotifications Internal


#example 2:

Set-Mailbox -Identity dave `
-ModerationEnabled $true `
-ModeratedBy administrator `
-SendModerationNotifications Internal


#example 3:

get-excommand | ?{$_.parameters.keys -eq 'ModerationEnabled'}


#example 4:

Set-DistributionGroup -Identity Executives `
-BypassModerationFromSendersOrMembers bob@contoso.com


#example 5:

$exclude = Get-Mailbox –Filter {Office –eq ‘San Diego’} | 
  Select-Object -ExpandProperty alias

Set-DistributionGroup -Identity Executives `
-BypassModerationFromSendersOrMembers $exclude
