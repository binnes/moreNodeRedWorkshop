*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
***

# Part 5 - 12-Factor Apps with Node-RED to take to production

This section looks at creating native cloud applications using Node-RED and how the [12-factor app](https://12factor.net) methodology can be applied to Node-RED.

## Setup for part 5

To complete the practical work in this section you will be working on your local system, so you need to have all the [prerequisites](../PREREQS.md) installed.

1. Run Node-RED locally on your laptop
    The instructions in this section assume you have started Node-RED on your local system at least once, which populates the .node-red directory in your user's home directory.  If not please start it now:
    - In a command window (as your local user - NOT admin) enter command ```node-red```
    - Once Node-RED is running you can stop the server by holding the Ctrl key then pressing the c key (**Ctrl-c**)
2. [Run a local broker](broker/README.md)
    The example flow in this section connects to a MQTT broker.  The linked section shows how to run the Eclipse Mosquitto MQTT broker in Docker on your local system.

## I    - [Codebase](CODEBASE.md)

One codebase tracked in revision control, many deploys

## II   - [Dependencies](DEPENDENCIES.md)

Explicitly declare and isolate dependencies

## III  - [Config](CONFIG.md)

Store config in the environment

## IV   - [Backing Services](BACKING.md)

Treat backing services as attached resources

## V    - [Build, release, run](BUILD.md)

Strictly separate build and run stages

## VI   - [Processes](PROCESSES.md)

Execute the app as one or more stateless processes

## VII  - [Port binding](PORT.md)

Export services via port binding

## VIII - [Concurrency](CONCURRENCY.md)

Scale out via the process model

## IX   - [Disposability](DISPOSABILITY.md)

Maximize robustness with fast startup and graceful shutdown

## X    - [Dev/prod parity](PARITY.md)

Keep development, staging, and production as similar as possible

## XI   - [Logs](LOGS.md)

Treat logs as event streams

## XII  - [Admin processes](ADMIN.md)

Run admin/management tasks as one-off processes

***
*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
