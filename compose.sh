#!/usr/bin/env bash

docker-compose -f docker-php54.yml -f docker-php55.yml -f docker-php56.yml -f docker-php70.yml $@
