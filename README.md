
﻿# choco-podman-machine-turnkey
Chocolatey package for a turn-key installation of podman-machine.  
Note: this package will automatically install VirtualBox to run the podman-machine VM

Installation Instructions:
    To install the podman-machine turn-key, run `choco install "package_name"` in command prompt or powershell

Uninstall Instructions: 
    To uninstall the podman-machine turn-key, run `choco uninstall "package_name"` in command prompt or powershell
    
Once Installed run these Commands:
    1. `podman-machine create box`
    2. `podman-machine ssh box`
    3. `tc@box:~$ sudo podman`
    
This will create a podman server, automatically connect to it via ssh, and install the latest boot2podman ISO. Once the latest ISO is installed, you can use the regular podman commands, found here: https://github.com/containers/libpod/blob/master/commands.md
It's important to note that only files on the VM will be visible to the containers. More information about accessing files, ports, and installing tools can be found here: https://github.com/boot2podman/machine/blob/master/README.md
