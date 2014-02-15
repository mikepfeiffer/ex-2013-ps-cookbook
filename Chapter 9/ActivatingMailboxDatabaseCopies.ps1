#example 1:

Move-ActiveMailboxDatabase DB01 `
-ActivateOnServer MBX2 `
-Confirm:$false


#example 2:

Move-ActiveMailboxDatabase -Server mbx2 `
-ActivateOnServer mbx1 `
-Confirm:$false


#example 3:

Move-ActiveMailboxDatabase DB01 `
-ActivateOnServer MBX1 `
-MountDialOverride GoodAvailability `
-Confirm:$false


#example 4:

Move-ActiveMailboxDatabase DB01 `
-ActivateOnServer MBX1 `
-SkipClientExperienceChecks `
-Confirm:$false


#example 5:

Move-ActiveMailboxDatabase DB01 `
-ActivateOnServer MBX1 `
-SkipHealthChecks `
-Confirm:$false


#example 6:

Move-ActiveMailboxDatabase DB01 `
-ActivateOnServer MBX1 `
-SkipLagChecks `
-Confirm:$false
