#example 1:

Set-Mailbox dave -EmailAddresses @{add='dave@east.contoso.com'}

Set-Mailbox dave -EmailAddresses @{
  add='dave@east.contoso.com',
  'dave@west.contoso.com',
  'dave@corp.contoso.com'
}

Set-Mailbox dave -EmailAddresses @{remove='dave@west.contoso.com'}

Set-Mailbox dave -EmailAddresses @{
  remove='dave@east.contoso.com',
  'dave@corp.contoso.com'
}


#example 2:

Set-Mailbox dave -EmailAddresses @{
  '+'='dave@east.contoso.com'
  '-'='dave@west.contoso.com'
}


#example 3:

foreach($i in Get-Mailbox -OrganizationalUnit Sales) {
  Set-Mailbox $i -EmailAddresses @{
    add="$($i.alias)@west.contoso.com"
  }
}


#example 4:

foreach($i in Get-Mailbox -ResultSize Unlimited) {
  $i.EmailAddresses | 
    ?{$_.SmtpAddress -like '*@corp.contoso.com'} | %{
      Set-Mailbox $i -EmailAddresses @{remove=$_}
    }
}
