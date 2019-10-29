*Quick links :*
[Home](/README.md) - [Part 1](../../part1/README.md) - [Part 2](../../part2/README.md) - [Part 3](../../part3/README.md) - [Part 4](../../part4/README.md) - [**Part 5**](../../part5/README.md)
***

# Part 5 - Run a local MQTT broker

Eclipse maintain the official Docker image for the Mosquitto broker.  We will use that container to run a local MQTT broker.

As we want to turn on security, so we can demonstrate how to get Node-RED node config from the environment, we need to create SSL certificates and create a password file.

1. You need a copy of the broker directory on your local system, so clone this git repository to your local system, if not already cloned:

    ```git clone https://github.com/binnes/moreNodeRedWorkshop.git```

    or if using ssh keys with github:
  
    ```git clone git@github.com:binnes/moreNodeRedWorkshop.git```

2. Certificates for this workshop are provided in this repo.  If you use the service names used in this course material you can use the provided certificates.  If you want to use your own names then use the proviced files to create your own certificates (it is recommended that you use the provided certificates).  
To generate your own certificates :  
    - Linux/MacOS - You will need to make the script file executable with command `chmod +x makeCerts.sh`, then you can run the script using command `./makeCerts.sh`
    - Windows - in a command window run the bat file `makeCerts.bat`  *Note: the .bat file assumes the default install location for SSL : c:\OpenSSL-Win64\bin\openssl.exe.  You need to modify the file if you installed SSL to a different location*
3. Start the MQTT Mosquitto container:

    ```docker run -itd -p 8883:8883 -v <full path to broker directory>/broker:/mosquitto --name mqttBroker eclipse-mosquitto```

    replace the `<full path to broker directory>` with the **fully qualified path** of the directory containing the broker directory, cloned from this repo.

    e.g. On windows, if I cloned the repository into my home directory **c:\Users\brian** then the command would be:  
    ```docker run -itd -p 8883:8883 -v c:\Users\brian\moreNodeRedWorkshop\en\part5\broker:/mosquitto --name mqttBroker eclipse-mosquitto```

    On Mac or Linux, if I cloned the repository into home directory **/Users/brian** then the command would be:  
    ```docker run -itd -p 8883:8883 -v /Users/brian/moreNodeRedWorkshop/en/part5/broker:/mosquitto --name mqttBroker eclipse-mosquitto```

4. Create a broker user in the container.  For this example the username is **mosquitto** with password **passw0rd**:

    ```docker exec mqttBroker mosquitto_passwd -b /mosquitto/config/passwd mosquitto passw0rd```

5. If you want to watch the mosquitto logs you can with command:

    ```docker logs -f mqttBroker```

When you have finished with the broker, you can remove the container with commands:

```docker kill mqttBroker```

```docker rm mqttBroker```

If you want to start the broker again you will need to delete all content from the **passwd** file in the **broker/config** directory, as new keys will be generated when a new container is started.  You will then need to add users to the container.

## Accessing the broker from another container

One issue you will quickly run into when using containers over local installs, is there isn't a flat network across containers running on the same system.  Each container has an isolated network, and ports exposed to the underlying host system with the **-p** option are not available as a local port within other containers running on the same host.

The legacy way of getting round this was to use the **link** option when running a container to be able to access other containers omn the same host using the container name, but whilst this still works at time of creating this material, Docker advises that the feature may be removed.

Docker has the ability to set up complex networking to isolate and manage traffic, but in this workshop we want to keep things simple, so the mqtt broker will export the port to the host system (port 8883), then other containers will access the mqtt broker as a remote system.  To achieve this you need to know the host system IP address, then use the --add-host command line argument when running a container to set an entry in the container hosts file to map hostname mqttBroker to the host network address, where the mqtt broker can be accessed on exported port 8883.  

To allow the SSL/TLS certificates to be verified the host name **localhost** can be used, for applications running natively on the host or **mqttBroker** for applications running in containers on the same host, launched with the **--add-host** option.  File v3.ext is where the hostnames that will be verified by the certificate are configured.

***
*Quick links :*
[Home](/README.md) - [Part 1](../../part1/README.md) - [Part 2](../../part2/README.md) - [Part 3](../../part3/README.md) - [Part 4](../../part4/README.md) - [**Part 5**](../../part5/README.md)
