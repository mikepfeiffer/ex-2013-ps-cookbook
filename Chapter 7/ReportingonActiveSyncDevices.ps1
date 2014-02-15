#example 1:

Get-ActiveSyncDeviceStatistics -Mailbox dsmith

Get-ActiveSyncDeviceStatistics -Mailbox dsmith | 
  select LastSuccessSync,Status,DevicePhoneNumber,DeviceType

Get-ActiveSyncDeviceStatistics -Mailbox dsmith | 
  select LastSuccessSync,Status,DevicePhoneNumber,DeviceType | 
    Export-CSV -Path c:\report.csv -NoType

	  
#example 2:

$dev = Get-ActiveSyncDevice | ?{$_.DeviceAccessState -eq 'Allowed'}
$dev | ForEach-Object {
  $mailbox = $_.UserDisplayName
  $stats = Get-ActiveSyncDeviceStatistics –Identity $_
  $stats | Select-Object @{n="Mailbox";e={$mailbox}},
    LastSuccessSync,
    Status,
    DevicePhoneNumber,
    DeviceType
}


#example 3:

$mbx = Get-CASMailbox | ?{$_.HasActiveSyncDevicePartnership}
$mbx | ForEach-Object {
  $mailbox = $_.Name
  $stats = Get-ActiveSyncDeviceStatistics -Mailbox $mailbox
  $stats | Select-Object @{n="Mailbox";e={$mailbox}},
    LastSuccessSync,
    Status,
    DevicePhoneNumber,
    DeviceType
}


#example 4:

Export-ActiveSyncLog `
-Filename C:\inetpub\logs\LogFiles\W3SVC1\u_ex101230.log `
-OutputPath c:\report


#example 5:

$path = "C:\inetpub\logs\LogFiles\W3SVC1\"
Get-ChildItem -Path $path -Filter u_ex1212*.log | %{
  Export-ActiveSyncLog -Filename $_.fullname `
  -OutputPrefix $_.basename `
  -OutputPath c:\report
}
