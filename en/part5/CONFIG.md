*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
***
**Part 3** - [Codebase](CODEBASE.md) - [Dependencies](DEPENDENCIES.md) - [**Config**](CONFIG.md) - [Backing services](BACKING.md) - [Build, release, run](BUILD.md) - [Processes](PROCESSES.md) - [Port binding](PORT.md) - [Concurrency](CONCURRENCY.md) - [Disposability](DISPOSABILITY.md) - [Dev/prod parity](PARITY.md) - [Logs](LOGS.md) - [Admin processes](ADMIN.md)
***

# III - Config

*Store config in the environment*

As an application is deployed in different environments (production, test) or in different regions of a production systems, then it often needs to connect to different services, so needs different configuration.  If the configuration is embedded in the application then a different build is needed for each deployment, which breaks the idea of a single build being deployed multiple times.

Cloud runtime environment pass configuration to applications through a number of different mechanisms.  Setting environment variables is a common approach.

In Node-RED the configuration is usually found within the configuration of the nodes.  In the previous section, when you enabled projects within the Node-RED editor you diabled configuration encryption, so it is easy to see the configuraition 

Some nodes are aware of Cloud Foundry services and will pull configuration from the **VCAP_SERVICES** environment variable to be able to automatically connect with Cloud Foundry hosted services.

## Enabling a Node-RED flow to get configuration from Environment Variables

In Node-RED you can get a property to be replaced by an environment variable by using syntax **${ENV_VAR}** in any string based configuration property.

So if I have an inject node and I set the payload property to be a string value **${WWW}** then the value I would inject will be the value of environment variable WWW (if the environment variable WWW is set):
![env var substitutions](image/envVarSubst.png).

To set an environment variable in a command window:
- Linux and MacOS : `export WWW=123`
- Windows : `set WWW=q123`

To see all environment variable that are set, simple enter command `set` on Linux, MacOS and Windows and you will see all the environment variables that are set.

To prevent config being captured in a flow you can replace all configuration of nodes by environment variables, so at run time the environment can provide the configuration to a flow, rather than the configuration being trapped in the flow.  This works for all string based values (including passwords).

For an MQTT node this is what the config may look like:
![MQTT Config](image/mqttBrokerConfig.png) ![MQTT Security conifig](image/mqttBrokerSecurityConfig.png) and the resultant flow file segment :

```JSON
{
    "id": "70723ea5.ce962",
    "type": "mqtt-broker",
    "z": "",
    "name": "myBrokerConfig",
    "broker": "${MQTT_HOST}",
    "port": "${MQTT_PORT}",
    "tls": "64dd09ff.068248",
    "clientid": "${MQTT_CLIENT_ID}",
    "usetls": true,
    "compatmode": false,
    "keepalive": "60",
    "cleansession": true,
    "birthTopic": "",
    "birthQos": "0",
    "birthRetain": "false",
    "birthPayload": "",
    "closeTopic": "",
    "closeQos": "0",
    "closeRetain": "false",
    "closePayload": "",
    "willTopic": "",
    "willQos": "0",
    "willRetain": "false",
    "willPayload": ""
}
```

and flow credentials file:

```JSON
{
  "70723ea5.ce962": {
      "user": "${MQTT_USER}",
      "password": "${MQTT_PWD}"
  }
}
```

You can see the environment variables, which will be substituted at runtime for the values contained in the environment variables.

When running the docker container you can use the **-e** option to pass in environment variables.  So a docker file containing the above configuration might look like `docker run -dit -e MQTT_CLIENT_ID=a:01o7le:nrApp -e MQTT_HOST=01o7le.messaging.internetofthings.ibmcloud.com -e MQTT_PORT=8883 -e MQTT_PWD="U_0!ZGOr4CtCX@H)w@" -e MQTT_USER="a-01o7le-4vhfpuwghh" -p 1880:1880 --name dockerNR binnes/node-red-docker-sample:latest`

***
**Part 3** - [Codebase](CODEBASE.md) - [Dependencies](DEPENDENCIES.md) - [**Config**](CONFIG.md) - [Backing services](BACKING.md) - [Build, release, run](BUILD.md) - [Processes](PROCESSES.md) - [Port binding](PORT.md) - [Concurrency](CONCURRENCY.md) - [Disposability](DISPOSABILITY.md) - [Dev/prod parity](PARITY.md) - [Logs](LOGS.md) - [Admin processes](ADMIN.md)
***
*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
