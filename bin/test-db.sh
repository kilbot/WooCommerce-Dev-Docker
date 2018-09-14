#!/bin/bash

# env variables
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
TESTS_DB_NAME=${DB_NAME}_tests

# create tests database
echo >&2 "Creating database for unit tests: $TESTS_DB_NAME;"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -Bse "CREATE DATABASE IF NOT EXISTS $TESTS_DB_NAME;"
