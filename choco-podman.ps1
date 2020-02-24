$installVBox = "choco install virtualbox -y"
$installPodman = "choco install podman-machine -y"
$testchoco = powershell choco -v

if(-not($testchoco)){
    Write-Output "Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey Version $testchoco is already installed"
}

Invoke-Expression $installVBox
Invoke-Expression $installPodman

Write-Output "To get started with podman-machine, run the following commands:"
Write-Output "$ podman-machine create box"
Write-Output "$ podman-machine ssh box"
Write-Output "tc@box:~$ sudo podman"
Write-Output "This will create a podman server, automatically connect to it via ssh, and install the latest boot2podman ISO. Once the latest ISO is installed, you can use the regular podman commands, found here: https://github.com/containers/libpod/blob/master/commands.md"
Write-Output "It's important to note that only files on the VM will be visible to the containers. More information about accessing files, ports, and installing tools can be found here: https://github.com/boot2podman/machine/blob/master/README.md"