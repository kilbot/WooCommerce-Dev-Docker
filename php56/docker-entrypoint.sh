#!/bin/bash
set -e

# env variables
PROJECT_NAME=${COMPOSE_PROJECT_NAME:=project}

WP_VERSION=${WP_VERSION:=latest}
WP_MULTISITE=${WP_MULTISITE:=0}
WC_VERSION=${WC_VERSION:=latest}

# download wordpress
if ! [ -e index.php -a -e wp-includes/version.php ]; then
  wp core download --allow-root --version=$WP_VERSION
fi

# wp-config
if [ ! -e wp-config.php ]; then
  wp core config --allow-root --skip-check --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'SCRIPT_DEBUG', true );
define( 'WP_HOME', 'http://$LOCALHOST_DOMAIN:$LOCALHOST_HTTP_PORT' );
define( 'WP_SITEURL', 'http://$LOCALHOST_DOMAIN:$LOCALHOST_HTTP_PORT');
PHP
fi

########
## install WordPress (set up db)
## & plugins (woocommerce)
#######

# install WordPress
if ! $(wp core is-installed --allow-root); then
# if ! [ -e index.php -a -e wp-includes/version.php ]; then
  echo 'WP IS NOT INSTALLED ... installing ...'
  if [ $WP_MULTISITE = "1" ]; then
    wp core multisite-install --allow-root --url=localhost --title=Localhost --admin_user=admin --admin_password=password --admin_email=email@example.com
  else
    wp core install --allow-root --url=localhost --title=Localhost --admin_user=admin --admin_password=password --admin_email=email@example.com
  fi

fi

# install WooCommerce
if ! [ -e wp-content/plugins/woocommerce/woocommerce.php ]; then

  if [ $WC_VERSION != "latest" ]; then
    wp plugin install woocommerce --allow-root --version=$WC_VERSION --activate
  else
    wp plugin install woocommerce --allow-root --activate
  fi

  wp plugin install wordpress-importer --allow-root --activate
  wp import $(wp plugin path --allow-root)/woocommerce/dummy-data/dummy-data.xml --allow-root --authors=create
  wp option update woocommerce_api_enabled yes --allow-root
  wp option update woocommerce_calc_taxes yes --allow-root
  wp rewrite structure '/%year%/%monthnum%/%postname%' --allow-root
  wp plugin deactivate wordpress-importer --allow-root
  # wp rewrite flush --hard --allow-root

fi

# install unit test library
if [ ! -d wordpress-tests-lib ]; then
  mkdir wordpress-tests-lib
  svn co --quiet https://develop.svn.wordpress.org/tags/$(wp core version --allow-root)/tests/phpunit/includes/ wordpress-tests-lib/includes
  curl -o wordpress-tests-lib/wp-tests-config-sample.php https://develop.svn.wordpress.org/tags/$(wp core version --allow-root)/wp-tests-config-sample.php
fi

# unit tests config
if [ ! -f wordpress-tests-lib/wp-tests-config.php ]; then
  cp wordpress-tests-lib/wp-tests-config-sample.php wordpress-tests-lib/wp-tests-config.php
  sed -i "s:dirname( __FILE__ ) . '/src/':'$(pwd)/':" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/youremptytestdbnamehere/$WORDPRESS_TESTS_DB_NAME/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/yourusernamehere/$WORDPRESS_DB_USER/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s/yourpasswordhere/$WORDPRESS_DB_PASSWORD/" wordpress-tests-lib/wp-tests-config.php
  sed -i "s|localhost|${WORDPRESS_DB_HOST}|" wordpress-tests-lib/wp-tests-config.php
fi

exec "$@"