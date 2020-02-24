# choco-podman-machine-turnkey
Chocolatey package for a turn-key installation of podman-machine

Installation Instructions:
    1. Right click powershell and select "Run as Administrator"
    2. Copy and paste the following `set-executionpolicy remotesigned`
    3. Right click choco-podman.ps1 and select "Run as Administrator"

Uninstall Instructions: 
    To uninstall VirtualBox run `choco uninstall virtualbox -y`
    To uninstall podman-machine run `choco uninstall podman-machine -y`
    
Once Installed run these Commands:
    1. `podman-machine create box`
    2. `podman-machine ssh box`
    3. `tc@box:~$ sudo podman`
    
This will create a podman server, automatically connect to it via ssh, and install the latest boot2podman ISO. Once the latest ISO is installed, you can use the regular podman commands, found here: https://github.com/containers/libpod/blob/master/commands.md
It's important to note that only files on the VM will be visible to the containers. More information about accessing files, ports, and installing tools can be found here: https://github.com/boot2podman/machine/blob/master/README.md
