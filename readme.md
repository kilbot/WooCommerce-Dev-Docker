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

#### Project name

Each project using this docker setup must have a Project name. It will be used by the setup to avoid conflicts when lauching multiple _docker composition_.

You define a `COMPOSE_PROJECT_NAME` _env variable_ in a docker-compose `.env` file and can use the `.env.example` file as an example.

You can then run `docker-compose -f docker.yml up -d` from the `.docker` directory to launch the containers.
If the `.env` file comes with the project and is located at the project's root you can run the command from the root directory and adjust the location of the `docker.yml` file to `.docker/docker.yml`.

#### Local development domain name

In the same `.env` file you can set a `LOCALHOST_DOMAIN` that wil be used as a base for your local development domain name for the project.

The complete domain name consists of the version of php the setup uses as a subdomain to your base domain name.
e.g. For the base setup using a php56 container to serve the app and a `LOCALHOST_DOMAIN` set to `odysseus.dev` the domain to add to your `hosts` file will be:
`php56.odysseus.dev`


