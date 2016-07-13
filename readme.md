# WooCommerce Development Docker

## Installation

### Requirements

* Docker >= 1.8.3
* Docker Compose

See [Docker.com](https://www.docker.com/products/docker) for more information.

### Useful commands

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