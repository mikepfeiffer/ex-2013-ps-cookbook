#example 1:

Set-Mailbox -Identity dsmith -AuditEnabled $true

Set-Mailbox -Identity dsmith -AuditLogAgeLimit 120

Set-Mailbox -Identity dsmith -AuditEnabled $false


#example 2:

$actions = "SoftDelete","HardDelete"
Set-Mailbox dsmith -AuditEnabled $true `
-AuditAdmin $actions `
-AuditDelegate $actions `
-AuditOwner $actions


#example 3:

Set-Mailbox -Identity dsmith -AuditEnabled $true `
-AuditDelegate SendAs,SendOnBehalf


#example 4:

Set-MailboxAuditBypassAssociation -Identity BESAdmin `
-AuditBypassEnabled $true


#example 5:

Set-MailboxAuditBypassAssociation -Identity BESAdmin `
-AuditBypassEnabled $false
