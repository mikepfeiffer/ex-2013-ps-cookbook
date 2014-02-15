#example 1:

Get-Mailbox -Database DB1 | Set-Mailbox -Office Headquarters

#example 2:

Get-Mailbox | Where-Object{$_.MaxSendSize -eq 10mb}

#example 3:

Get-User | 
  Where-Object{$_.title -eq "Exchange Admin"} | Foreach-Object{
      Add-RoleGroupMember -Identity "Organization Management" `
      -Member $_.name
  }

#example 4:

Get-User | 
  ?{$_.title -eq "Exchange Admin"} | %{
    Add-RoleGroupMember -Identity "Organization Management" `
    -Member $_.name
  }

#example 5:

Get-User | 
  Where{$_.title -eq "Exchange Admin"} | foreach{
    Add-RoleGroupMember -Identity "Organization Management" `
    -Member $_.name
  }
