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

#### Using a COMPOSE_PROJECT_NAME

To be able to avoid conflicts when lauching multiple _docker composition_ docker-compose relies on 3 mechanisms:

- if you don't care about project name because you will only launch ONE docker-compose stack, then don't use anything ^^
- if you simply need to set a project name to preprend the name of your containers, use the -p option: `docker-compose -p my-project-name -f .docker docker.yml up -d`
- if you need to set the project name to preprend the name of your container AND you need to access the project name inside the docker-compose file, via ${COMPOSE_PROJECT_NAME} then you should use export the ENV variable COMPOSE_PROJECT_NAME.

see: https://github.com/docker/compose/issues/3431#issuecomment-221291167

The docker compose file will use a `COMPOSE_PROJECT_NAME` _env variable_ if it can find one  

Typically you will have a `.env` file in the project root from where you will execute:  

`docker-compose -f .docker docker.yml up -d`
