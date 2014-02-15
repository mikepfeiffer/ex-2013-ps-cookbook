#example 1:

New-RetentionPolicyTag -Name AllUsers-Inbox `
-Type Inbox `
-Comment "Items older than 90 days are deleted" `
-RetentionEnabled $true `
-AgeLimitForRetention 90 `
-RetentionAction PermanentlyDelete

New-RetentionPolicyTag -Name AllUsers-Default `
-Type All `
-Comment "Items older than 120 days are permanently deleted" `
-RetentionEnabled $true `
-AgeLimitForRetention 120 `
-RetentionAction PermanentlyDelete

New-RetentionPolicyTag -Name Critical `
-Type Personal `
-Comment "Use this tag for all critical items" `
-RetentionEnabled $true `
-AgeLimitForRetention 730 `
-RetentionAction DeleteAndAllowRecovery

New-RetentionPolicy –Name AllUsers `
-RetentionPolicyTagLinks AllUsers-Inbox,AllUsers-Default,Critical


#example 2:

Set-RetentionPolicy -Identity Sales-Users `
-RetentionPolicyTagLinks Sales-Inbox,Sales-DeletedItems


#example 3:

$Tags = (Get-RetentionPolicy Sales-Users).RetentionPolicyTagLinks
$NewTags = Get-RetentionPolicyTag Sales-Critical
$Tags += $NewTags
Set-RetentionPolicy Sales-Users -RetentionPolicyTagLinks $Tags


#example 4:

Get-RetentionPolicyTag –IncludeSystemTags
