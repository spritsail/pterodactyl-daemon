# Pterodactyl Daemon
Docker image for the process controlling daemon of the Pterodactyl Panel.

## Usage
The Daemon is used in tandem with the [Pterodactyl Panel](https://pterodactyl.io) to control game servers in a Docker environment. A docker image for the panel front-end can be found [here](https://github.com/Spritsail/Pterodactyl-Panel).

## Ports
This container requires port 8080 exposed to the Pterodactyl Panel and to the Panel clients.

## Volumes
All paths below are representing the path inside the container, unless otherwise mentioned.   

`/srv/daemon/config` - Directory for all main daemon config files   

`/srv/daemon/packs` - Directory for Server data packs   

`/srv/daemon/scripts` - Directory for Server startup scripts   

`/tmp/pterodactyl` - Directory for temporary log files. Highly recommended to be mounted as tmpfs.   

`/var/run/docker.sock` - Passed through docker sock from the host. Must be the same path inside and out of the container.   

`/srv/daemon-data` - This folder may be mounted anywhere inside the container, **but must have identical paths for the host and container.**   

A volume for the SSL certificates is required if you are using SSL communication.   

## Example run command

``` docker run -d --name Pterodactyl-Daemon --restart on-failure:10 -v /volumes/daemon/config:/srv/daemon/config -v /volumes/daemon/packs:/srv/daemon/packs -v /volumes/daemon/scripts:/srv/daemon/scripts -v /var/run/docker.sock -v /srv/daemon-data:/srv/daemon-data --tmpfs=/tmp/pterodactyl -p 8080:8080 spritsail/pterodactyl-daemon ```

