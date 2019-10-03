*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
***

# Workshop prerequisites

Before you start working through the workshop please ensure you have all the prerequisites installed to be able to complete the required work.  This page sets out all the software you need to have installed on your laptop or workstation and all accounts you need to have setup.

## Software to be installed

- [Node.js](https://nodejs.org/en/) v8 or current supported level of Node.JS
- [Python]() v2.7 - Python 3.x not supported for building Node.js native modules
- Build tools needed for building Node.js native modules
  - Linux : `apt-get install build-essential` or equivalent on your Linux distribution
  - MacOS : `xcode-select --install`
  - Windows : `npm install --global --production windows-build-tools` from an elevated PowerShell or CMD.exe run as Administrator
- [Docker](https://www.docker.com) desktop or Docker community edition - version 19.03 or higher needs to be installed
  - MacOS and Windows : install Docker Desktop
  - Linux :
    - `curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh`
    - `sudo usermod -aG docker $USER`
    - `docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d`
    - `echo 'export DOCKER_CLI_EXPERIMENTAL=enabled' >>~/.bashrc`
    - `sudo systemctl enable docker.service`
    - `sudo systemctl start docker.service`

## Accounts needed

- [IBM Cloud](https://cloud.ibm.com) free IBM Cloud lite account
- [Docker Hub](https://hub.docker.com) account
- [GitHub](https://github.com) account
- [Twitter developer](https://developer.twitter.com) account
- [MapBox Developer](https://www.mapbox.com/developer-network/#join_dev_net) account (Optional)

***
*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
