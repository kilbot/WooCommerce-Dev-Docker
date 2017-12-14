# WooCommerce Development Docker

## Installation

### Requirements

* Docker >= 1.8.3
* Docker Compose

See [Docker.com](https://www.docker.com/products/docker) for more information.

### Getting Started

copy .env.example to .env

`$ cp .env.example .env`

#### Start
`$ docker-compose up -d`

#### Shut down
`$ docker-compose kill`

#### List containers
`$ docker-compose ps`

#### Open container bash
`$ docker-compose run nginx /bin/bash`

#### Remove all docker containers and images
> Only execute if you know what you are doing!

`$ docker rm $(docker ps -a -q)`
`$ docker rmi $(docker images -q)`

### Windows users

If you clone this repository on a Windows machine the files will be saved with hidden Windows characters. This will produce an `exec user process caused "no such file or directory"` error with the `docker-entrypoint.sh` files. To fix this error you will need to run the `dos2unix` command on each `docker-entrypoint.sh` file. You will also need to rebuild the docker containers, eg:

```
$ docker-compose -f docker.yml kill
$ for /f "delims=" %a in ('dir docker-entrypoint.sh /b /s') do dos2unix %a
$ docker-compose -f docker.yml build
$ docker-compose -f docker.yml up -d
```
