*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
***
**Part 3** - [Codebase](CODEBASE.md) - [**Dependencies**](DEPENDENCIES.md) - [Config](CONFIG.md) - [Backing services](BACKING.md) - [Build, release, run](BUILD.md) - [Processes](PROCESSES.md) - [Port binding](PORT.md) - [Concurrency](CONCURRENCY.md) - [Disposability](DISPOSABILITY.md) - [Dev/prod parity](PARITY.md) - [Logs](LOGS.md) - [Admin processes](ADMIN.md)
***

# II - [Dependencies](https://12factor.net/dependencies)

*Explicitly declare and isolate dependencies*

Node-RED is no different from Node.js applications here.  

All dependencies are specified in the package.json file.  However, there are still '*hidden*' dependencies that can creep into a project when a package has some native dependencies that need to be installed in the host system running the application.

To get round this the starter project has a Dockerfile which will build the source from the revision control system and build a container containing the application.  The Dockerfile captures all *hidden* dependencies.

The provided Dockerfile in the starter project initially creates a build container to build the required software, then creates an applications image, copying built content from the build container.  This way a fully defined build environment is created and used.

## Building the application

Before building the app we will add another few nodes to add an Web endpoint.

1. Import the following JSON to add the **/hello** endpoint:

    ```JSON
    [{"id":"55dd0376.f7c64c","type":"http in","z":"3af82246.3634ae","name":"","url":"/hello","method":"get","upload":false,"swaggerDoc":"","x":130,"y":420,"wires":[["c656aba7.944288"]]},{"id":"c2380ca8.0463","type":"http response","z":"3af82246.3634ae","name":"","statusCode":"","headers":{},"x":470,"y":420,"wires":[]},{"id":"c656aba7.944288","type":"change","z":"3af82246.3634ae","name":"","rules":[{"t":"set","p":"payload","pt":"msg","to":"{\"text\":\"Hello\"}","tot":"json"}],"action":"","property":"","from":"","to":"","reg":false,"x":300,"y":420,"wires":[["c2380ca8.0463"]]}]
    ```

2. Commit and push the change to git
3. Enable experimental features in Docker:
    - Linux ?
    - MacOS and Windows
      - Start Docker if it is not running
      - Click the Docker icon in the bottom notification window and select **settings** or **Preferences** then the **Daemon** section.  Enable Experimental features
4. Open a command window.  You will use the new docker buildx command to build and push a multi-arch image to dockerhub.
5. Before you can build a container you need to create a new builder.  Enter the command:  
  `docker buildx create --name NRbuilder --use`
6. Check you have a builder running using command : `docker buildx ls`
7. Inspect the builder with command : `docker buildx inspect --bootstrap`, which will also start the builder if it is not running
8. Now the builder is up and running you can build a multi-arch container and push it to your dockerhub account.  First ensure you are logged into dockerhub : `docker login`
9. Build and push the image : `docker buildx build --platform linux/amd64,linux/arm/v7 -t binnes/node-red-docker-sample --push .`, replace **binnes** with your docker username.  Here you see we are asking to build an image for 3 different architectures.  AMD/Intel 64 bit, ARM 64bit and ARM 32bit v7 (Raspberry Pi 3/4).  You can also add additional architectures, such as **linux/s390x** to add support for IBM Z systems or **linux/ppc64le** for IBM POWER systems
10. Inspect the image using command `docker buildx imagetools inspect docker.io/binnes/node-red-docker-sample:latest`
11. Stop your local Node-RED using Ctrl-C then run the container using command : `docker run -dit -p 1880:1880 binnes/node-red-docker-sample:latest`.
12. Test your container.  
    - You will not be able to launch the Editor, as this has been disabled in the sample project settings.js file - in a production Node-RED container you should not be able to alter the application, so the editor needs to be disabled.  Details of the Node-RED configuration options can be found in the [Node-RED documentation](https://nodered.org/docs/user-guide/runtime/configuration).  
    - You should be able to access the [/hello](http://localhost:1880/hello) endpoint
13. If you have a Raspberry Pi or other ARM 32-bit or ARM 64-bit system you can also test that the ARM containers also work.

***
**Part 3** - [Codebase](CODEBASE.md) - [**Dependencies**](DEPENDENCIES.md) - [Config](CONFIG.md) - [Backing services](BACKING.md) - [Build, release, run](BUILD.md) - [Processes](PROCESSES.md) - [Port binding](PORT.md) - [Concurrency](CONCURRENCY.md) - [Disposability](DISPOSABILITY.md) - [Dev/prod parity](PARITY.md) - [Logs](LOGS.md) - [Admin processes](ADMIN.md)
***
*Quick links :*
[Home](/README.md) - [Part 1](../part1/README.md) - [Part 2](../part2/README.md) - [Part 3](../part3/README.md) - [Part 4](../part4/README.md) - [**Part 5**](../part5/README.md)
