$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/boot2podman/machine/releases/download/v0.17/podman-machine.windows-amd64.exe' # download url, HTTPS preferred
$installVBox = "choco install virtualbox -y"
$PName = 'podman-machine'
$checksum = 'A5424DEDED50004F0F7AC488B5415C782770B7DA58F609C50DF22739F956BEA3'
$checksumType   = 'sha256'

#$packageArgs = @{
  #packageName   = $env:ChocolateyPackageName
  #unzipLocation = $toolsDir
  #fileType      = 'EXE' #only one of these: exe, msi, msu
  #url           = $url#'https://github.com/boot2podman/machine/releases/download/v0.17/podman-machine.windows-amd64.exe'
  
  #softwareName  = 'Podman-Machine-turnkey*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  #checksum       = $checksum
  #checksumType   = $checksumType
  #silentArgs    = "/S"#"/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  #validExitCodes= @(0) #please insert other valid exit codes here
#}

Get-ChocolateyWebFile `
  -PackageName $PName `
  -Url64bit "$url" `
  -FileFullPath "$toolsDir\podman-machine.exe" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType

Invoke-Expression $installVBox

#Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package


Write-Output " "
Write-Output "-------------------------------------------------------------------------------------------------------------------------------------"
Write-Output "TO GET STARTED WITH PODMAN-MACHINE, RUN THE FOLLOWING COMMANDS:"
Write-Output " "
Write-Output "$ podman-machine create box"
Write-Output "$ podman-machine ssh box" 
Write-Output "tc@box:~$ sudo podman"
Write-Output " " 
Write-Output "This will create a podman server, automatically connect to it via ssh, and install the latest boot2podman ISO. Once the latest ISO is installed, you can use the regular podman commands, found here: https://github.com/containers/libpod/blob/master/commands.md"
Write-Output " "
Write-Output "It's important to note that only files on the VM will be visible to the containers. More information about accessing files, ports, and installing tools can be found here: https://github.com/boot2podman/machine/blob/master/README.md"
Write-Output "-------------------------------------------------------------------------------------------------------------------------------------"
Write-Output " "
