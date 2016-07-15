# create tests database
echo >&2 "Creating database for unit tests: $MYSQL_TESTS_DATABASE;"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -Bse "CREATE DATABASE IF NOT EXISTS $MYSQL_TESTS_DATABASE;"