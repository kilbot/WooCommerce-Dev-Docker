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
WP_FOLDER=wp_${WP_MULTISITE}_${WP_VERSION}

## copy variables into wp-cli.yml
source /dev/stdin <<<"$(echo 'cat <<EOF >wp-cli.yml'; cat /wp-cli.template.yml; echo EOF;)"

## download wordpress
wp core download --allow-root --version=$WP_VERSION
wp config create --allow-root

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
wp package install git@github.com:kilbot/wp-cli-fixtures.git --allow-root
#wp fixtures load --allow-root

## activate the current project
wp plugin activate $PROJECT_NAME --allow-root

## move into WordPress folder
cd $WP_FOLDER

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
  sed -i "s/yourusernamehere/$DB_USER/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/yourpasswordhere/$DB_PASSWORD/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s|localhost|${DB_HOST}|" wordpress-tests-lib/wp-tests-config.php
fi

##
exec "$@"