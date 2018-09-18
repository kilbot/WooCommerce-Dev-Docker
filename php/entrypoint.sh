#!/bin/bash
set +e

## env variables
PROJECT_NAME=${PROJECT_NAME}
WP_VERSION=${WP_VERSION}
WP_MULTISITE=${WP_MULTISITE}
WC_VERSION=${WC_VERSION}
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
DB_HOST=${DB_HOST}
DB_NAME=${DB_NAME}
DB_PASSWORD=${DB_PASSWORD}
WP_USER=${WP_USER}
WP_EMAIL=${WP_EMAIL}
WP_PASSWORD=${WP_PASSWORD}
WP_TITLE=${WP_TITLE}
WP_URL=${WP_URL}
WP_PATH=wp/${WP_VERSION//.} && [[ $WP_MULTISITE == "1" ]] && WP_PATH="${WP_PATH}_multisite"

## construct database prefix, eg: wpl_wc3.4.5
DB_PREFIX=wp
[[ $WP_MULTISITE == "1" ]] && DB_PREFIX+="m"
[[ $WP_VERSION == "nightly" ]] && DB_PREFIX+="n"
[[ $WP_VERSION == "latest" ]] && DB_PREFIX+="l"
[[ $WP_VERSION != "nightly" ]] && [[ $WP_VERSION != "latest" ]] && DB_PREFIX+="${WP_VERSION//.}"

DB_PREFIX+="_wc"
[[ $WC_VERSION == http* ]] && DB_PREFIX+="b"
[[ $WC_VERSION == "latest" ]]  && DB_PREFIX+="l"
[[ $WC_VERSION != http* ]] && [[ $WC_VERSION != "latest" ]] && DB_PREFIX+="${WC_VERSION//.}"

## copy variables into wp-cli.yml
source /dev/stdin <<<"$(echo 'cat <<EOF >wp-cli.yml'; cat wp-cli.template.yml; echo EOF;)"

## download wordpress
mkdir wp
wp core download --allow-root --version=$WP_VERSION
wp config create --allow-root --skip-check

## install WordPress
WP_INSTALL="install" && [[ $WP_MULTISITE == "1" ]] && WP_INSTALL="multisite-install"
wp core $WP_INSTALL --allow-root

## install WooCommerce: url, version, latest
## note: WooCommerce will be overwritten each time the container is started
if [[ $WC_VERSION == http* ]]; then
  wp plugin install $WC_VERSION --allow-root --activate --force
elif [[ $WC_VERSION == "latest" ]]; then
  wp plugin install woocommerce --allow-root --activate --force
else
  wp plugin install woocommerce --version=$WC_VERSION --allow-root --activate --force
fi

## wordpress and woocommerce settings
wp option update woocommerce_api_enabled yes --allow-root
wp option update woocommerce_calc_taxes yes --allow-root
wp rewrite structure '/%year%/%monthnum%/%postname%' --allow-root

## install fake data
if [ ! -d vendor ]; then
  wp package install git@github.com:kilbot/wp-cli-fixtures.git --allow-root
fi

wp fixtures load --allow-root --file=[ ! -f fixtures.yml ] && "fixtures.example.yml"

## activate the current project
wp plugin activate $PROJECT_NAME --allow-root

## move into WordPress folder
cd $WP_PATH

## install unit test library
if [ ! -d wordpress-tests-lib ]; then
  mkdir wordpress-tests-lib
  svn co --quiet https://develop.svn.wordpress.org/tags/$(wp core version --allow-root)/tests/phpunit/includes/ wordpress-tests-lib/includes
  curl -o wordpress-tests-lib/wp-tests-config-sample.php https://develop.svn.wordpress.org/tags/$(wp core version --allow-root)/wp-tests-config-sample.php
fi

## unit tests config
if [ ! -f wordpress-tests-lib/wp-tests-config.php ]; then
  cp wordpress-tests-lib/wp-tests-config-sample.php wordpress-tests-lib/wp-tests-config.php
  sed -i "s:dirname( __FILE__ ) . '/src/':'$(pwd)/':" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/youremptytestdbnamehere/$DB_NAME/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/yourusernamehere/root/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/yourpasswordhere/$DB_PASSWORD/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s|localhost|${DB_HOST}|" wordpress-tests-lib/wp-tests-config.php
fi

##
exec "$@"
