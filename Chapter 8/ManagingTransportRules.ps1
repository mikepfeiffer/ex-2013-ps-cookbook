#example 1:

New-TransportRule -Name Confidential `
-Enabled $true `
-SubjectContainsWords Confidential `
-BlindCopyTo Administrator@contoso.com


#example 2:

New-TransportRule -Name ITSupport `
-Enabled $true `
-HeaderMatchesMessageHeader X-Department `
-HeaderMatchesPatterns ITSupport `
-AddToRecipients administrator@contoso.com


#example 3:

New-TransportRule -Name ITSupport `
-Enabled $true `
-HeaderMatchesMessageHeader X-Department `
-HeaderMatchesPatterns ITSupport `
-ExceptIfFrom administrator@contoso.com `
-AddToRecipients administrator@contoso.com


#example 4:

(Get-TransportRule Confidential).Conditions | Format-List

(Get-TransportRule Confidential).Actions | Format-List


#example 5:

Get-TransportRule | Where-Object {$_.SubjectContainsWords}


#example 6:

Set-TransportRule –Identity Confidential `
  -BlindCopyTo sysadmin@contoso.com

Set-TransportRule –Identity Confidential `
  -BlindCopyTo $null `
  -RedirectMessageTo sysadmin@contoso.com 

Set-TransportRule -Identity ITSupport -Priority 0


#example 7:

Disable-TransportRule -Identity Confidential -Confirm:$false

Enable-TransportRule -Identity Confidential

Remove-TransportRule -Identity Confidential -Confirm:$false


#example 8:

Get-DlpPolicyTemplate | select Name

New-DlpPolicy -Name "Block Credit Card" -Template "U.S. Financial Data" `
-Mode Enforce

New-TransportRule -Name "Override CEO" -DlpPolicy "Block Credit Card" `
-From "ceo@contoso.com" -SetHeaderName `
"X-Ms-Exchange-Organization-Dlp-SenderOverrideJustification" `
-SetHeaderValue "TransportRule override" -SetAuditSeverity Medium

Get-TransportRule | ?{$_.MessageContainsDataClassifications -notlike ""} |
  Set-TransportRule -GenerateIncidentReport dlp@contoso.com `
  -IncidentReportOriginalMail IncludeOriginalMail
