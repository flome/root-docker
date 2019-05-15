# root-docker
Docker container for ROOT build on Ubuntu base image. Currently, ROOT v.6.16 based on Ubuntu 18.04 is used.

You can build the container yourself using the Dockerfile or pull the image from the [DockerHub repository](https://cloud.docker.com/repository/registry-1.docker.io/smflment/root-docker)

## Run container

Run the container using
```
docker run -it --name root smflment/root:ubuntu-18-04 bash
```
If you want the container to be removed after exit, add the ```--rm``` option.

To interact graphically with the container, you need to pass X11 information:
```
docker run -it --rm --ipc=host --net=host \
           -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v "$HOME/.Xauthority:/root/.Xauthority:rw"  \
           --name root \
           smflment/root:ubuntu-18-04 bash
```
Or you need to start the container and connect to it using ```ssh -Y```
