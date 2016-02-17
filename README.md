# Docker AirControl
Ubiquiti AirControl 2 in a Docker container.

## From Docker Hub

To use AirControl from Docker Hub, you juste have to run:

~~~bash
docker run -d --name aircontrol -p 9081:9081 mool/aircontrol
~~~

## First use

After the container is launched, you can connect to your Docker host on the 9081 port.
The default user is `admin` and the default password is `AirC0ntrol`.
