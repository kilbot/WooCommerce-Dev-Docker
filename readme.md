# WooCommerce Development Docker


## Overview

This docker-compose environment allows you to run a matrix of PHP, MySQL, WordPress and WooCommerce configurations, for example:

| PHP | MySQL | WordPress |   WooCommerce   | Multisite |
|:---:|:-----:|:---------:|:---------------:|:---------:|
| 5.4 |  5.6  |    4.7    |      3.2.6      |     0     |
| 5.5 |  5.7  |    4.8    |      3.3.5      |     1     |
| 5.6 |  8.0  |   latest  |      3.4.4      |           |
| 7.0 |       |  nightly  |      latest     |           |
| 7.2 |       |           | http://beta.url |           |

## Requirements

* Docker >= 1.8.3
* Docker Compose

See [Docker.com](https://www.docker.com/products/docker) for more information. You can install Docker directly from [Docker installation page](https://docs.docker.com/engine/installation/)


## Getting started

1. Make a new project folder and clone (or download) the WooCommerce Development Docker repository:
```bash
$ mkdir my-plugin && cd my-plugin
$ git clone https://github.com/kilbot/WooCommerce-Dev-Docker.git ./docker
```

2. Populate your plugin files, either from an existing project or perhaps using a WordPress Plugin Boilerplate. 
Copy the `.env` and `fixtures.yml` files from the .docker directory.
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

3. Start the containers
```bash
$ docker-compose -f .docker/docker.yml up -d
```

4. Go to `https://localhost/wp-admin/admin.php?page=wc-status` and check your development environment with the following credientials:
```
user: admin
password: password
```

> The first build may take some time to complete. If you can not access the site, try again after 5-10 minutes.


## Configuration

The `.env` file contains the default settings for the docker containers. 

Dummy data is created using the `fixtures.yml` template. 


## Docker compose management

### Start
```bash
$ docker-compose -f .docker/docker.yml up -d
```

### Shut down
```bash
$ docker-compose -f .docker/docker.yml kill
```

### List active containers
```bash
$ docker ps
```

### Open container bash
```bash
$ docker exec -it <CONTAINER ID or CONTAINER NAME> bash
```

### Purge all docker containers and images
```bash
$ docker system purge -fa
or
$ docker system prune -fa
```

### Purge data and html folders
```bash
$ rm -rf .data && rm -rf .html
```
