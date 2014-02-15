#example 1:

Get-MailboxStatistics -Database DB1 | 
  ForEach-Object {$_.TotalItemSize.value.ToMB()} | 
    Measure-Object -Average | 
      Select-Object –ExpandProperty Average

	 
#example 2:

Get-MailboxStatistics -Database DB1 | 
  Where-Object{!$_.DisconnectDate -and !$_.IsArchive} | 
    ForEach-Object {$_.TotalItemSize.value.ToMB()} | 
      Measure-Object -Average | 
        Select-Object –ExpandProperty Average

	
#example 3:

$MBAvg = Get-MailboxStatistics -Database DB1 | 
  ForEach-Object {$_.TotalItemSize.value.ToMB()} | 
    Measure-Object -Average | 
      Select-Object –ExpandProperty Average

[Math]::Round($MBAvg,2)

"{0:n2}" -f $MBAvg

[double]("{0:n2}" -f $MBAvg)


#example 4:

foreach($DB in Get-MailboxDatabase) {
  Get-MailboxStatistics -Database $DB | 
    ForEach-Object{$_.TotalItemSize.value.ToMB()} | 
      Measure-Object -Average | 
        Select-Object @{n="Name";e={$DB.Name}},
          @{n="AvgMailboxSize";e={[Math]::Round($_.Average,2)}} | 
            Sort-Object AvgMailboxSize -Desc
}
