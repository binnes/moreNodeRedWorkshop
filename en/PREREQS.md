*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
***

# Workshop prerequisites

To work through the workshop you will need a laptop with an up to date version of Linux, Mac OS or Windows.

Before you start working through the workshop please ensure you have all the prerequisites installed to be able to complete the required work:

## Software to be installed

- [Node.js](https://nodejs.org/en/) v8 or current supported level of Node.JS
- [Python](https://www.python.org) v2.7 - Python 3.x is not supported for building Node.js native modules
- Build tools needed for building Node.js native modules
  - Linux : `apt-get install build-essential` or equivalent on your Linux distribution
  - MacOS : `xcode-select --install`
  - Windows : `npm install --global --production windows-build-tools` from an elevated PowerShell or CMD.exe run as Administrator
- [Node-RED]() - a local install of Node-RED
  - MacOS and Linux - Open up a command prompt and enter command `sudo npm install -g --unsafe-perm node-red` to install Node-RED.  
  - Windows - In an command window run as Administrator run the command `npm install -g --unsafe-perm node-red`
- [Docker](https://www.docker.com) desktop or Docker community edition - version 19.03 or higher needs to be installed
  - MacOS and Windows : install Docker Desktop
  - Linux :
    - `curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh`
    - `sudo usermod -aG docker $USER`
    - `docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d`
    - `echo 'export DOCKER_CLI_EXPERIMENTAL=enabled' >>~/.bashrc`
    - `sudo systemctl enable docker.service`
    - `sudo systemctl start docker.service`
- *Optional* [openssl](https://slproweb.com/products/Win32OpenSSL.html), which is needed to create SSL/TLS certificates.
  - MacOS : OpenSSL is installed as part of MacOS
  - Linux : OpenSSL is usually installed as part of the operating system, if not install the openssl package : `sudo apt-get install openssl`
  - Windows: there are 2 options to run OpenSSL, using a binary install (easiest) or using the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10):
    - **Binary install** : Download version 1.1.x from [here](https://slproweb.com/products/Win32OpenSSL.html) and install to default location.  If you get an error about missing **MSVCR120.dll** then you can download it from [the Microsoft support site](https://support.microsoft.com/en-us/help/3179560)
    - **Windows subsystem for Linux** : Follow the instructions [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10).  Select Debian as the Linux distribution, then when it is installed launch Debian then run the following commands at the Linux command prompt:
      - `sudo apt-get update ; sudo apt-get upgrade`
      - `sudo apt-get install openssl`

## Accounts needed

- [Docker Hub](https://hub.docker.com) account
- [GitHub](https://github.com) account

***
*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
