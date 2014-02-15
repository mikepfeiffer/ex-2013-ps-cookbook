#example 1:

$legal = Get-DynamicDistributionGroup -Identity legal
Get-Recipient -RecipientPreviewFilter $legal.RecipientFilter


#example 2:

Get-Recipient -RecipientPreviewFilter "Department -eq 'Legal'"


#example 3:

function Get-DynamicDistributionGroupMember {
	param(
	[Parameter(Mandatory=$true)]
	$Identity
	)

	$group = Get-DynamicDistributionGroup -Identity $Identity
	Get-Recipient -RecipientPreviewFilter $group.RecipientFilter
	
}
