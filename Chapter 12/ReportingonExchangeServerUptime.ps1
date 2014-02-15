#example 1:

$OS = Get-WmiObject Win32_OperatingSystem
$OS.LastBootUpTime
$OS.ConvertToDateTime($OS.LastBootUpTime)
(Get-Date)-$OS.ConvertToDateTime($OS.LastBootUpTime)


#example 2:

function Get-Uptime {
  param(
    [Parameter(
      Position=0,
      ValueFromPipelineByPropertyName=$true,
      Mandatory=$true)]
    [String]$Name   
  )

  process {
    $OS = Get-WmiObject Win32_OperatingSystem -ComputerName $Name
    $lastBoot = $OS.ConvertToDateTime($OS.LastBootUpTime)
    $upTime = (Get-Date) - $OS.ConvertToDateTime($OS.LastBootUpTime)
        
    New-Object PSObject -Property @{
      Server = $Name
      LastBoot = $lastBoot
      DaysUp = $upTime.Days
      HoursUp = $upTime.Hours
      MinutesUp = $upTime.Minutes
    }
  }
}


#example 3:

Get-Uptime mbx1

#example 4:

Get-ExchangeServer | Get-UpTime | 
  Export-CSV c:\uptime.csv -NoTypeInformation
