# WooCommerce Development Docker

## Installation

### Requirements

* Docker >= 1.8.3
* Docker Compose

See [Docker.com](https://www.docker.com/products/docker) for more information. You can install Docker directly from [Docker installation page](https://docs.docker.com/engine/installation/)

## Overview

This docker-compose environment allows to run concomitantly all 4 PHP versions and 2 mysql versions at the same time, making the development of WooCommerce plugins against all possible versions of PHP on the wild easy.

This docker-compose automatically installs WooCommerce plugin, so when running you must to see the plugin installed on Wordpress Admin panel.

## Getting Started

Follow bellow steps to get all running.

### Configuration

In `.env` file there are commented out environment variables named `LOCALHOST_PHPXX_PORT` where `XX` is the PHP version. 

These variables are being assigned with a PORT number to setup the HTTP listening port for each container. 

There are `LOCALHOST_HTTP_PORT` and `LOCALHOST_HTTPS_PORT` variables for setup nginx load balancer listening ports also, and `LOCALHOST_MYSQL56_PORT` and `LOCALHOST_MYSQL57_PORT` for each mysql version.

IN `mysql.env` file there are environment variables with mysql root user and database credentials.

In `wordpress.env` are placed wordpress database configuration info.

### Setup

1. Copy .env.example to .env

    `$ cp .env.example .env`

2. Setup host aliases:

    On Mac: 

    ```sh
    sudo tee -a /private/etc/hosts <<EOF 
    127.0.0.1 php54.local
    127.0.0.1 php55.local
    127.0.0.1 php56.local
    127.0.0.1 php70.local
    127.0.0.1 db-mysql56
    127.0.0.1 db-mysql57
    EOF
    ```

    On Linux: 

    ```sh
    sudo tee -a /etc/hosts <<EOF 
    127.0.0.1 php54.local
    127.0.0.1 php55.local
    127.0.0.1 php56.local
    127.0.0.1 php70.local
    127.0.0.1 db-mysql56
    127.0.0.1 db-mysql57
    EOF
    ```

3. Start containers

    `$ ./compose.sh up -d`


4. Access on browser each version

### Accessing Wordpress Admin

1. In order to access the Wordpress Admin, hit the browser with this url:

    `http://php70.local/wp-admin`

2. Enter the follow credentials:
  
    ```
    user: admin
    password: password
    ```

## Development workspace

All development is done on `.html` directory, it is the workspace where all wordpress files are placed.

## Docker compose management

The `compose.sh` file is a wrapper to `docker-compose` command pointing to all docker-compose files needed to run all versions at the same time, so all docker-compose command variants are accepted by `compose.sh`.

### Start
`$ ./compose.sh up -d`

### Shut down
`$ ./compose.sh kill`

### List containers
`$ ./compose.sh ps`

### Open container bash
`$ ./compose.sh run nginx /bin/bash`

### Remove all docker containers and images
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
