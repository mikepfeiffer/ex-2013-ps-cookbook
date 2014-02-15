#example 1:

$mailboxes = Get-Mailbox

$mailboxes | 
  Select-Object Name,
    Database,
    @{name="Title";expression={(Get-User $_.Name).Title}},
    @{name="Dept";expression={(Get-User $_.Name).Department}}

$mailboxes | %{
  New-Object PSObject -Property @{
    Name = $_.Name
    Database = $_.Database
    Title = (Get-User $_.Name).Title
    Dept = (Get-User $_.Name).Department
  }
}

$mailboxes | %{
  $obj = New-Object PSObject
  $obj | Add-Member NoteProperty Name $_.Name
  $obj | Add-Member NoteProperty Database $_.Database
  $obj | Add-Member NoteProperty Title (Get-User $_.Name).Title
  $obj | Add-Member NoteProperty Dept (Get-User $_.Name).Department
  Write-Output $obj
}

#example 2:

$mailboxes | 
  Select-Object Name,
    Database,
    @{n="Title";e={(Get-User $_.Name).Title}},
    @{n="Dept";e={(Get-User $_.Name).Department}} | 
      Export-CSV –Path C:\report.csv -NoType

#example 3:

$mailboxes | 
  Select-Object Name,
    Database,
    @{n="Title";e={(Get-User $_.Name).Title}},
    @{n="Dept";e={(Get-User $_.Name).Department}}

#example 4:

$mailboxes | %{
  $obj = "" | Select-Object Name,Database,Title,Dept
  $obj.Name = $_.Name
  $obj.Database = $_.Database
  $obj.Title = (Get-User $_.Name).Title
  $obj.Dept = (Get-User $_.Name).Department
  Write-Output $obj
}

