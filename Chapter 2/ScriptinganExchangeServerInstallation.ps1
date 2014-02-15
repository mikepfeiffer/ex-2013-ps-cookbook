#example 1:

param($Path)
if(Test-Path $Path) {
  switch -wildcard ($env:computername) {
    "*-EX*" {$role = "CA,MB" ; break}
    "*-MB*"  {$role = "MB" ; break}
    "*-CA-*"  {$role = "CA" ; break}
  }
  $setup = Join-Path $Path "setup.exe"
  Invoke-Expression "$setup /mode:install /r:$role /IAcceptExchangeServerLicenseTerms /InstallWindowsComponents"
}
else {
  Write-Host "Invalid Media Path!"
}


#example 2:

param($Path)
$site = [DirectoryServices.ActiveDirectory.ActiveDirectorySite]

if(Test-Path $Path) {
  switch ($site::GetComputerSite().Name) {
    "Headquarters" {$role = "MB"}
    Default {$role = "CA,MB"}
  }
  $setup = Join-Path $Path "setup.exe"
  Invoke-Expression "$setup /mode:install /r:$role /IAcceptExchangeServerLicenseTerms /InstallWindowsComponents"
}
else {
  Write-Host "Invalid Media Path!"
}
