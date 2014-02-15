#example 1:

Set-ActiveSyncOrganizationSettings –DefaultAccessLevel Quarantine `
–AdminMailRecipients administrator@contoso.com

Set-CASMailbox -Identity dsmith `
-ActiveSyncAllowedDeviceIDs BAD73E6E02156460E800185977C03182


#example 2:

Set-ActiveSyncOrganizationSettings –DefaultAccessLevel Quarantine `
–AdminMailRecipients helpdesk@contoso.com `
-UserMailInsert 'Call the Help Desk for immediate assistance'

Get-ActiveSyncDevice | 
  ?{$_.DeviceAccessState -eq 'Quarantined'} | 
    fl UserDisplayName,DeviceAccessState,DeviceID

	  
#example 3:

New-ActiveSyncDeviceAccessRule –QueryString PocketPC `
–Characteristic DeviceModel `
–AccessLevel Allow
