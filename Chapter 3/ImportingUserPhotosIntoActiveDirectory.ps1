#example 1:

Import-RecipientDataProperty -Identity dave `
-Picture `
-FileData (
  [Byte[]](
    Get-Content -Path C:\dave.jpg `
    -Encoding Byte `
    -ReadCount 0
  )
)


#example 2:

$oab = Get-OfflineAddressBook ‘Default Offline Address Book’
$oab.ConfiguredAttributes.Remove('thumbnailphoto,indicator')

Set-OfflineAddressBook ‘Default Offline Address Book’ `
-ConfiguredAttributes $oab.ConfiguredAttributes


#example 3:

$oab = Get-OfflineAddressBook ‘Default Offline Address Book’
$oab.ConfiguredAttributes.Add('thumbnailphoto,value')

Set-OfflineAddressBook ‘Default Offline Address Book’ `
-ConfiguredAttributes $oab.ConfiguredAttributes


#example 4:

Update-OfflineAddressBook 'Default Offline Address Book'


#example 5:

$photos = Get-ChildItem \\server01\employeephotos -Filter *.jpg

foreach($i in $photos) {
  [Byte[]]$data = gc -Path $i.fullname -Encoding Byte -ReadCount 0
  Import-RecipientDataProperty $i.basename -Picture -FileData $data
}
