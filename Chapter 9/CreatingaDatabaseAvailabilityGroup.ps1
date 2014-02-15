#example 1:

New-DatabaseAvailabilityGroup -Name DAG `
-WitnessServer CAS1 `
-WitnessDirectory C:\FSW `
-DatabaseAvailabilityGroupIPAddresses 192.168.1.55


#example 2:

New-DatabaseAvailabilityGroup -Name DAG

Get-DatabaseAvailabilityGroup -Identity DAG

Set-DatabaseAvailabilityGroup -Identity DAG `
-WitnessServer CAS1 `
-WitnessDirectory C:\FSW `
-DatabaseAvailabilityGroupIPAddresses 192.168.1.55


#example 3:

New-DatabaseAvailabilityGroup -Name DAG `
-DatabaseAvailabilityGroupIPAddresses 10.1.1.10,192.168.1.10

Set-DatabaseAvailabilityGroup -Identity DAG `
-DatabaseAvailabilityGroupIPAddresses 10.1.1.25,192.168.1.25
