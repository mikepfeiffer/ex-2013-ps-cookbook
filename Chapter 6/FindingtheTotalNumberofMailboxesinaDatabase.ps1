#example 1:

@(Get-Mailbox -Database DB1).count

Get-Mailbox -Database DB1 | Measure-Object


#example 2:

(Get-Mailbox -Database DB1 | Measure-Object).Count

Get-Mailbox -Database DB1 | 
  Measure-Object | 
    Select-Object -ExpandProperty Count

Measure-Command -Expression {@(Get-Mailbox -Database DB1).Count}


#example 3:

Get-MailboxDatabase | 
  Select-Object Name,
    @{n="TotalMailboxes";e={@(Get-Mailbox -Database $_).count}}
