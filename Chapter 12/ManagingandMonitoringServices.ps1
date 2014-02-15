#example 1:

Get-Service *exch*


#example 2:

Get-Service *exch* | Where-Object {$_.Status -eq 'Running'}


#example 3:

Get-MailboxServer | ForEach-Object {
  Get-Service *exch* -ComputerName $_.Name | 
    Where-Object {$_.Status -eq 'Running'}
}


#example 4:

$s = Get-WmiObject Win32_Service -Filter "Name = 'IISAdmin'"
$s

$s.StopService()

$s.StartService()


#example 5:

Get-Service MSExchangeUM -ComputerName tlex01 | Format-List *


#example 6:

$servers = Get-ExchangeServer | Select-Object -ExpandProperty Name

Get-WmiObject Win32_Service -ComputerName $servers `
-Filter "Name Like '%exch%' AND StartMode='Auto' AND State='Stopped'" |    Foreach-Object {$_.StartService()}


#example 7:

Test-ServiceHealth -Server mbx1,mbx2


#example 8:

Get-MailboxServer | Test-ServiceHealth

#example 9:

Test-ServiceHealth | 
  Select-Object -ExpandProperty ServicesNotRunning |
    Start-Service


#example 10:

$servers = "mbx1","mbx2"

while($true){
  $servers | Foreach-Object {
    $name = $_
    $s = Test-ServiceHealth -Server $name | 
      Select-Object -ExpandProperty ServicesNotRunning

    if($s) {
      $s | Foreach-Object {
        $date = Get-Date

        $wmi = Get-WmiObject Win32_Service -Filter "Name = '$_'" `
        -ComputerName $name
        
        $wmi.StartService()
      
        Send-MailMessage -To administrator@contoso.com `
        -From powershell@contoso.com `
        -Subject "Service Failure on $name" `
        -Body "Attempted to start the $_ service at $date" `
        -SmtpServer cas1      
      }
    }
  }
  Start-Sleep –Seconds 300
}
