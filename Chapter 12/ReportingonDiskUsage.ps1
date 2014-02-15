#example 1:

Get-WmiObject Win32_LogicalDisk -Filter "DriveType='3'" | 
  select @{n="Drive";e={$_.DeviceId}},
         @{n="Size";e={[math]::Round($_.Size/1gb,2)}},
         @{n="FreeSpace";e={[math]::Round($_.FreeSpace/1gb,2)}}


#example 2:

function Get-DiskUsage {
  param(
    [Parameter(
      Position=0,
      ValueFromPipelineByPropertyName=$true,
      Mandatory=$true)]
    [String]$Name   
  )
  
  process {
    Get-WmiObject Win32_LogicalDisk `
    -ComputerName $Name -Filter "DriveType='3'" | 
      select @{n="Server";e={$_.SystemName}},
             @{n="Drive";e={$_.DeviceId}},
             @{n="Size";e={[math]::Round($_.Size/1gb,2)}},
             @{n="FreeSpace";e={[math]::Round($_.FreeSpace/1gb,2)}}
  }
}


#example 3:

Get-ExchangeServer | 
  Get-DiskUsage | Where-Object {$_.FreeSpace -lt 20} | 
    Export-CSV C:\Disk_Report.csv -NoTypeInformation


#example 4:

Get-WmiObject Win32_LogicalDisk

$c = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'"
$c.Size
$c.Size/1gb
[math]::Round($c.Size/1gb,2)


#example 5:

Get-Counter "\LogicalDisk(*)\% Free Space"


#example 6:

function Get-DiskFreeSpacePercentage {
  param(
    [Parameter(
      Position=0,
      ValueFromPipelineByPropertyName=$true,
      Mandatory=$true)]
    [String]$Name   
  )
  
  process {
    $free = Get-Counter "\LogicalDisk(*)\% Free Space" -comp $Name
    $free.CounterSamples | ?{$_.InstanceName -match ":"} | 
      select @{n="Server";e={$Name}},
             @{n="Drive";e={$_.InstanceName}},
	     @{n="PercentFree";e={[Math]::Round($_.CookedValue,2)}}
  }
}


#example 7:

Get-MailboxServer | Get-DiskFreeSpacePercentage
