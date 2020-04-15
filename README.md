
﻿# choco-podman-machine-turnkey
Chocolatey package for a turn-key installation of podman-machine.  
Note: this package will automatically install VirtualBox to run the podman-machine VM

Installation Instructions:
    To install the podman-machine turn-key, open powershell or command prompt and navigate to the directory where you want the repository files to be downloaded. Then clone the repository using `git clone https://github.com/ttu-capstone-podman/choco-podman-machine-turnkey.git`. Once the repository has been cloned, install the package by running `choco install podman-machine-turnkey --source="'path\to\directory\choco-podman-machine-turnkey'" -y`

Uninstall Instructions: 
    To uninstall the podman-machine turn-key, run `choco uninstall podman-machine-turnkey` in command prompt or powershell, then delete the local repository from the file system.
    
Once Installed run these Commands:
    1. `podman-machine create box`
    2. `podman-machine ssh box`
    3. `tc@box:~$ sudo podman`
    
This will create a podman server, automatically connect to it via ssh, and install the latest boot2podman ISO. Once the latest ISO is installed, you can use the regular podman commands, found here: https://github.com/containers/libpod/blob/master/commands.md
It's important to note that only files on the VM will be visible to the containers. More information about accessing files, ports, and installing tools can be found here: https://github.com/boot2podman/machine/blob/master/README.md
