#example 1:

$OS = Get-WmiObject Win32_OperatingSystem
$CS = Get-WmiObject Win32_ComputerSystem


#example 2:

$OS.FreePhysicalMemory/1mb
$CS.TotalPhysicalMemory/1gb


#example 3:

function Get-Memory {
  param(
    [Parameter(
      Position=0,
      ValueFromPipelineByPropertyName=$true,
      Mandatory=$true)]
    [String]$Name   
  )
  
  process {
    $OS = Get-WmiObject Win32_OperatingSystem `
    -ComputerName $Name
    $CS = Get-WmiObject Win32_ComputerSystem `
    -ComputerName $Name
  
    $free = [math]::Round($OS.FreePhysicalMemory /1mb,2)
    $total = [math]::Round($CS.TotalPhysicalMemory /1gb)
  
    New-Object PSObject -Property @{
      Server = $Name
      "Memory Total (GB)" = $total
      "Free Memory (GB)" = $free
    }
  }
}


#example 4:

Get-ExchangeServer | Get-Memory
