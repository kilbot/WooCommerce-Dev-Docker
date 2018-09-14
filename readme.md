# WooCommerce Development Docker


## Overview

This docker-compose environment allows you to run concomitantly a matrix of PHP, MySQL, WordPress and WooCommerce versions.

| PHP |  MySQL  | WordPress | WooCommerce | Multisite |
|-----|---------|-----------|-------------|-----------|
| 5.4 |   5.6   |    4.7    |    3.2.6    |     0     |
| 5.5 |   5.7   |    4.8    |    3.3.5    |     1     |
| 5.6 |   8.0   |   latest  |    3.3.4    |           |
| 7.0 | mariadb |  nightly  |    latest   |           |
| 7.2 |         |           |  http://url |           |

## Requirements

* Docker >= 1.8.3
* Docker Compose
* git

See [Docker.com](https://www.docker.com/products/docker) for more information. You can install Docker directly from [Docker installation page](https://docs.docker.com/engine/installation/)


## Getting Started

Follow bellow steps to get all running.


### Setup

1. Make a new project folder and clone the WooCommerce Development Docker repository:
```bash
mkdir my-plugin && cd my-plugin
git clone https://github.com/kilbot/WooCommerce-Dev-Docker.git ./docker
```

2. Populate your plugin files, either from an existing project or perhaps using a WorPress Plugin Boilerplate. 
Copy the .env and fixtures.yml files from the .docker directory.
```bash
$ cp .docker/.env.example .env
$ cp .docker/fixtures.example.yml fixtures.yml
```

At a minimum you should now have a `my-plugin` folder with the structure below:
```
my-plugin/
+-- .docker
+-- .env
+-- fixtures.yml
+-- index.php
+-- readme.txt
```

2. Find your hosts file, `Mac: /private/etc/hosts`, `Linux:/etc/hosts` or `Win:\Windows\System32\Drivers\etc\hosts` and add the aliases below:
```
127.0.0.1 php54.local
127.0.0.1 php55.local
127.0.0.1 php56.local
127.0.0.1 php70.local
127.0.0.1 mysql56.local
127.0.0.1 mysql57.local
```

3. Start containers
```bash
$ ./compose.sh up -d
```

4. Go to `http://php72.local/wp-admin` and access your development site with the following credientials:
```
user: admin
password: password
```

**Note:** The first build may take some time to complete. If you can not access the site, try again after 5-10 minutes.
    
### Configuration

In `.env` file there are commented out environment variables named `LOCALHOST_PHPXX_PORT` where `XX` is the PHP version. 

These variables are being assigned with a PORT number to setup the HTTP listening port for each container. 

There are `LOCALHOST_HTTP_PORT` and `LOCALHOST_HTTPS_PORT` variables for setup nginx load balancer listening ports also, and `LOCALHOST_MYSQL56_PORT` and `LOCALHOST_MYSQL57_PORT` for each mysql version.


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

Linux & Mac: `$ docker system purge -fa`
Win: `$ docker system prune -fa`
