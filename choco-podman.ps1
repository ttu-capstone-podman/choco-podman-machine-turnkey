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