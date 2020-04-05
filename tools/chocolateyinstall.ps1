# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/boot2podman/machine/releases/download/v0.17/podman-machine.windows-amd64.exe' # download url, HTTPS preferred
#$url64      = '' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url
#$fileLocation = "C:\Users\jdeto\Desktop\Podman-Machine-TurnKey\choco-podman-machine-turnkey\choco-podman.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = $url
  #url64bit      = $url64
  #file         = $fileLocation

  softwareName  = 'Podman-Machine-TurnKey*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # Checksums are now required as of 0.10.0.
  # To determine checksums, you can get that from the original site if provided. 
  # You can also use checksum.exe (choco install checksum) and use it 
  # e.g. checksum -t sha256 -f path\to\file
  $checksum       = 'A5424DEDED50004F0F7AC488B5415C782770B7DA58F609C50DF22739F956BEA3'
  $checksumType   = 'sha256'
  

  # MSI
  silentArgs    = "/S"#"/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0) #please insert other valid exit codes here
}

$installVBox = "choco install virtualbox -y"
Invoke-Expression $installVBox

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package

Write-Host "To get started with podman-machine, run the following commands:"
Write-Host "$ podman-machine create box"
Write-Host "$ podman-machine ssh box"
Write-Host "tc@box:~$ sudo podman"
Write-Host "This will create a podman server, automatically connect to it via ssh, and install the latest boot2podman ISO. Once the latest ISO is installed, you can use the regular podman commands, found here: https://github.com/containers/libpod/blob/master/commands.md"
Write-Host "It's important to note that only files on the VM will be visible to the containers. More information about accessing files, ports, and installing tools can be found here: https://github.com/boot2podman/machine/blob/master/README.md"