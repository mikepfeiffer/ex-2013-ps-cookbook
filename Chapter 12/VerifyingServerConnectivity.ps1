#example 1:

Test-Connection -ComputerName mbx1


#example 2:

Test-Connection -ComputerName mbx1,mbx2


#example 3:

Test-Connection -ComputerName mbx1,mbx2 -Count 1


#example 4:

Get-ExchangeServer | 
  ForEach-Object{Test-Connection -ComputerName $_.Name -Count 1}


#example 5:

Get-Content C:\servers.txt | 
  Where-Object {Test-Connection $_ -Quiet -Count 1} | 
    Foreach-Object {
      Get-Service *exch* -ComputerName $_
    }
