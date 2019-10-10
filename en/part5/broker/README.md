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

2. Certificates for localhost are provided in this repo.  You can use them or use the provided makeCerts script files to create your own:  
    - Linux/MacOS - You will need to make the script file executable with command `chmod +x makeCerts.sh`, then you can run the script using command `./makeCerts.sh`
    - Windows - in a command window run the bat file `makeCerts.bat`  *Note: the .bat file assumes the default install location for SSL : c:\OpenSSL-Win64\bin\openssl.exe.  You need to modify the file if you installed SSL to a different location*
3. Start the MQTT Mosquitto container:

    ```docker run -itd -p 8883:8883 -v <path to broker directory>\broker:/mosquitto --name mqttBroker eclipse-mosquitto```

    replace the `<path to broker directory>` with the fully qualified path of the directory containing the broker directory, cloned from this repo.

4. Create a broker user in the container.  For this example the username is **mosquitto** with password **passw0rd**:

    ```docker exec mqttBroker mosquitto_passwd -b /mosquitto/config/passwd mosquitto passw0rd```

5. If you want to watch the mosquitto logs you can with command:

    ```docker logs -f mqttBroker```

When you have finished with the broker, you can remove the container with commands:

```docker kill mqttBroker```

```docker rm mqttBroker```

If you want to start the broker again you will need to delete all content from the **passwd** file in the **broker/config** directory, as new keys will be generated when a new container is started.  You will then need to add users to the container.

***
*Quick links :*
[Home](/README.md) - [Part 1](../../part1/README.md) - [Part 2](../../part2/README.md) - [Part 3](../../part3/README.md) - [Part 4](../../part4/README.md) - [**Part 5**](../../part5/README.md)
