#example 1:

Test-Path $profile

notepad $profile

#example 2:
New-Item -type file –path $profile -force

#example 3:

$profile.psextended | Format-List
