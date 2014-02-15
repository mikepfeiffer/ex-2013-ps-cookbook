#example 1:

Set-Location $exscripts
cd $exscripts

.\StartDagServerMaintenance.ps1 -ServerName mbx1


#example 2:

.\StopDagServerMaintenance.ps1 -ServerName mbx1


#example 3:

.\RedistributeActiveDatabases.ps1 -DagName DAG `
-BalanceDbsByActivationPreference `
-ShowFinalDatabaseDistribution `
-Confirm:$false
