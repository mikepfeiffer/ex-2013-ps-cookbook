#example 1:

Get-TransportService -Identity ex01 | fl ConnectivityLog*


#example 2:

Set-TransportService -Identity ex01 `
-ConnectivityLogMaxAge 45 `
-ConnectivityLogMaxDirectorySize 5gb


#example 3:

Get-TransportService | 
  Set-TransportService -ConnectivityLogMaxAge 45 `
  -ConnectivityLogMaxDirectorySize 5gb

  
#example 4:

Set-TransportService -Identity mb1 `
-SendProtocolLogMaxAge 45 `
-ReceiveProtocolLogMaxAge 45


#example 5:

Set-SendConnector -Identity Internet -ProtocolLoggingLevel Verbose


#example 6:

Get-ReceiveConnector -Identity *\Relay | 
  Set-ReceiveConnector -ProtocolLoggingLevel Verbose

  
#example 7:

Set-TransportService -Identity mb1 `
-IntraOrgConnectorProtocolLoggingLevel Verbose


#example 8:

$logpath = (Get-TransportService -Identity mb1).ConnectivityLogPath

$data = $logs | %{
  Get-Content $_.Fullname | %{
    $IsHeaderParsed = $false
    if($_ -like '#Fields: *' -and !$IsHeaderParsed) {
      $_ -replace '^#Fields: '
      $IsHeaderParsed = $true
    }
    else {
      $_
    }
  } | ConvertFrom-Csv
}

$data | Where-Object{$_.description -like '*fail*'}
