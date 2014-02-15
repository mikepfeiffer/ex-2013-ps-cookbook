#example 1:

Get-Content  c:\temp\users.txt | ForEach-Object {
  Add-DistributionGroupMember –Identity Sales -Member $_
}


#example 2:

Import-Csv C:\temp\users.csv | ForEach-Object {
  Add-DistributionGroupMember Sales -Member $_.EmailAddress
}
