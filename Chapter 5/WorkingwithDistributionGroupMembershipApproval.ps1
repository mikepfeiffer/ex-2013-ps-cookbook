#example 1:

Set-DistributionGroup -Identity CompanyNews `
-MemberJoinRestriction Open `
-MemberDepartRestriction Open


#example 2:

Set-DistributionGroup -Identity AllEmployees `
-ManagedBy dave@contoso.com,john@contoso.com
