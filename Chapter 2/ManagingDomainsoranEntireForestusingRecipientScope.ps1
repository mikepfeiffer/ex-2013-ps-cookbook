#example 1:

Set-AdServerSettings -RecipientViewRoot contoso.com/sales

Set-AdServerSettings -RecipientViewRoot `
"OU=sales,DC=contoso,DC=com"

#example 2:

Set-AdServerSettings -ViewEntireForest $true

#example 3:

Set-AdServerSettings -RecipientViewRoot corp.contoso.com

#example 4:

Set-AdServerSettings -ViewEntireForest $true `
-SetPreferredDomainControllers dc1.adatum.com `
-PreferredGlobalCatalog dc1.adatum.com
