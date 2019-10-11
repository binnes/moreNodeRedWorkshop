*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
***
**Part 5** - [Codebase](CODEBASE.md) - [Dependencies](DEPENDENCIES.md) - [Config](CONFIG.md) - [Backing services](BACKING.md) - [**Build, release, run**](BUILD.md) - [Processes](PROCESSES.md) - [Port binding](PORT.md) - [Concurrency](CONCURRENCY.md) - [Disposability](DISPOSABILITY.md) - [Dev/prod parity](PARITY.md) - [Logs](LOGS.md) - [Admin processes](ADMIN.md)
***

# V - Build, release, run

*Strictly separate build and run stages*

In this workshop the approach presented naturally fits the build. release, run model advocated in the 12-factor methodology.  The build stage takes the codebase and create a container, which is stored in a registry.  The run stage will then take the required version of the registry and deploy it.

A Continuous Integration / Continuous Delivery (CI/CD) pipeline will often be used to automate the process.  Where a delivery of code into the source control system will trigger a build to create a new version of the container and automatically deploy the newly created container to a staging system for testing.

The run stage is commonly managed by a cloud platform, such as RedHat OpenShift, which manages the application by pulling the required version of a container from the registry, providing the required configuration to the container, deploying the required number of instances of the container, monitoring the running containers and routing traffic to the container instances.

The [starter Node-RED git repo](https://github.com/binnes/Node-RED-Docker) has health check built in to allow a cloud environment to monitor the application using endpoints:

- /live
- /ready
- /health

[**TODO** - add minishift pipeline tutorial or demo ???????]

***
**Part 5** - [Codebase](CODEBASE.md) - [Dependencies](DEPENDENCIES.md) - [Config](CONFIG.md) - [Backing services](BACKING.md) - [**Build, release, run**](BUILD.md) - [Processes](PROCESSES.md) - [Port binding](PORT.md) - [Concurrency](CONCURRENCY.md) - [Disposability](DISPOSABILITY.md) - [Dev/prod parity](PARITY.md) - [Logs](LOGS.md) - [Admin processes](ADMIN.md)
***
*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
