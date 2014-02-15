#example 1:

Get-Counter –Counter '\\tlex01\MSExchange OWA\Current Users'

Get-Counter '\\tlex01\MSExchange RpcClientAccess\User Count'


#example 2:

Get-Counter 'MSExchange OWA\Current Unique Users' `
-ComputerName tlex01,tlex02


#example 3:

Get-Counter -ListSet *owa* -ComputerName mbx1 | 
  Select-Object -expand paths

  
#example 4:

function Get-ActiveUsers {
  [CmdletBinding()]
  param(
    [Parameter(Position=0, 
      ValueFromPipelineByPropertyName=$true, 
      Mandatory=$true)]
    [string[]]
    $Name
  )

  process {
    $Name | %{
      $RPC = Get-Counter "\MSExchange RpcClientAccess\User Count" `
      -ComputerName $_
      
      $OWA = Get-Counter "\MSExchange OWA\Current Unique Users" `
      -ComputerName $_
      
      New-Object PSObject -Property @{
        Server = $_
        'HTTP/RPC' = $RPC.CounterSamples[0].CookedValue
        'Outlook Web App' = $OWA.CounterSamples[0].CookedValue
      }
    }
  }
}
