#example 1:

$user = "contoso\administrator"
$pass = ConvertTo-SecureString -AsPlainText "P@ssw0rd01" -Force
$creds = New-Object System.Management.Automation.PSCredential `
-ArgumentList $user,$pass

Test-ActiveSyncConnectivity -MailboxCredential $creds -URL "https://mail.contoso.com/Microsoft-Server-ActiveSync"
Test-ActiveSyncConnectivity -MailboxCredential $creds -UseAutodiscoverForClientAccessServer

Test-ActiveSyncConnectivity –MailboxCredential $creds –
UseAutodiscoverForClientAccessServer


#example 2:

Test-CalendarConnectivity
Test-CalendarConnectivity -MailboxServer MBX01 -TestType External


#example 3:

Test-OutlookWebServices -MailboxCredential $creds -Identity administrator@contoso.com


#example 4:

Test-WebServicesConnectivity
Test-WebServicesConnectivity -Identity administrator@contoso.com -MailboxCredential $creds


#example 5:

Test-PopConnectivity -MailboxServer MBX01 -TrustAnySSLCertificate


#example 6:

Test-ImapConnectivity -MailboxServer MBX01 -TrustAnySSLCertificate
