# This runs in 0.9.10+ before upgrade and uninstall.
# Use this file to do things like stop services prior to upgrade or uninstall.
# NOTE: It is an anti-pattern to call chocolateyUninstall.ps1 from here. If you
#  need to uninstall an MSI prior to upgrade, put the functionality in this
#  file without calling the uninstall script. Make it idempotent in the
#  uninstall script so that it doesn't fail when it is already uninstalled.
# NOTE: For upgrades - like the uninstall script, this script always runs from 
#  the currently installed version, not from the new upgraded package version.
Write-host "Please close all Podman-Machine and Virtual box processes on local host before continuing."
read-host “Press ENTER to continue...”

$ProcessActive = Get-Process VirtualBox -ErrorAction SilentlyContinue
#If process is not running
if($ProcessActive -eq $null) {
 continue
}

#If process is running
else {
 Stop-Process -Name "VirtualBox" -Force
 Write-Host "Force closed VirtualBox"
}

$ProcessActive = Get-Process podman-machine -ErrorAction SilentlyContinue
#If process is not running
if($ProcessActive -eq $null) {
 continue
}

#If process is running
else {
 Stop-Process -Name "podman-machine" -Force
 Write-Host "Force closed podman-machine"
}
