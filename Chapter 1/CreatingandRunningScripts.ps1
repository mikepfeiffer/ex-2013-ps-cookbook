#example 1:

param(
  $name,
  $maxsendsize,
  $maxreceivesize,
  $city,
  $state,
  $title,
  $department
)

Set-Mailbox -Identity $name `
-MaxSendSize $maxsendsize `
-MaxReceiveSize $maxreceivesize

Set-User -Identity $name `
-City $city `
-StateOrProvince $state `
-Title $title `
-Department $department

Add-DistributionGroupMember -Identity DL_Sales `
-Member $name

#example 2:

C:\Update-SalesMailbox.ps1 -name testuser `
-maxsendsize 25mb `
-maxreceivesize 25mb `
-city Phoenix `
-state AZ `
-title Manager `
-department Sales

#example 3:

foreach($i in Get-Mailbox -OrganizationalUnit contoso.com/sales) {
  c:\Update-SalesMailbox.ps1 -name $i.name `
  -maxsendsize 100mb `
  -maxreceivesize 100mb `
  -city Phoenix `
  -state AZ `
  -title 'Sales Rep' `
  -department Sales
}

Set-ExecutionPolicy RemoteSigned
