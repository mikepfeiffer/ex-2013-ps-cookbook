#example 1:

Get-DatabaseAvailabilityGroupNetwork 


#example 2:

Set-DatabaseAvailabilityGroup -Identity DAG –DiscoverNetworks


#example 3:

Set-DatabaseAvailabilityGroup –Identity DAG –ManualDagNetworkConfiguration $True

Set-DatabaseAvailabilityGroupNetwork -Identity DAG\MapiDagNetwork `
-ReplicationEnabled $false


#example 4:

Set-DatabaseAvailabilityGroupNetwork -Identity DAG\DAGNetwork04 `
-IgnoreNetwork $true


#example 5:

Get-DatabaseAvailabilityGroupNetwork 

Remove-DatabaseAvailabilityGroupNetwork -Identity DAG\ReplicationDagNetwork `
-Confirm:$false

Set-DatabaseAvailabilityGroupNetwork -Identity DAG\ReplicationDagNetwork03 `
-Name DAGNetwork02
