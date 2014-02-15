#example 1:

Import-Module ServerManager
Add-WindowsFeature NLB, RSAT-NLB

$servers = ‘cas1’,’cas2’,’cas3’,’cas4’
Invoke-Command -ScriptBlock {
  Import-Module servermanager;Add-WindowsFeature NLB,RSAT-NLB
} -ComputerName $servers


#example 2:

Import-Module NetworkLoadBalancingClusters

New-NlbCluster -InterfaceName NLB `
-ClusterName CASLB `
-HostName CAS1 `
-ClusterPrimaryIP 172.16.23.200


#example 3:

Get-NlbClusterPortRule | Remove-NlbClusterPortRule -Force


#example 4:

Get-NlbCluster | 
  Add-NlbClusterPortRule -StartPort 80 `
  -EndPort 80 `
  -Protocol TCP `
  -Affinity Single

Get-NlbCluster | 
  Add-NlbClusterPortRule -StartPort 443 `
  -EndPort 443 `
  -Protocol TCP `
  -Affinity Single

Get-NlbCluster | 
  Add-NlbClusterPortRule -StartPort 25 `
  -EndPort 25 `
  -Protocol TCP `
  -Affinity Single

  
#example 5:

Get-NlbCluster | 
  Add-NlbClusterNode -NewNodeName cas2 `
  -NewNodeInterface NLB

  
#example 6:

'cas2','cas3','cas4' | ForEach-Object{
  Get-NlbCluster | 
    Add-NlbClusterNode -NewNodeName $_ `
    -NewNodeInterface NLB
}
