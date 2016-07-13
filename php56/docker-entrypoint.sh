#!/bin/bash
set -e

if [ ! -d $BUILD_TAG ]; then
  mkdir -p $BUILD_TAG
fi

cd $BUILD_TAG

if [[ "$1" == apache2* ]] || [ "$1" == php-fpm ]; then
	: "${WORDPRESS_DB_HOST:=mysql}"
	# if we're linked to MySQL and thus have credentials already, let's use them
	: ${WORDPRESS_DB_USER:=${MYSQL_ENV_MYSQL_USER:-root}}
	if [ "$WORDPRESS_DB_USER" = 'root' ]; then
		: ${WORDPRESS_DB_PASSWORD:=$MYSQL_ENV_MYSQL_ROOT_PASSWORD}
	fi
	: ${WORDPRESS_DB_PASSWORD:=$MYSQL_ENV_MYSQL_PASSWORD}
	: ${WORDPRESS_DB_NAME:=${MYSQL_ENV_MYSQL_DATABASE:-wordpress}}

	if [ -z "$WORDPRESS_DB_PASSWORD" ]; then
		echo >&2 'error: missing required WORDPRESS_DB_PASSWORD environment variable'
		echo >&2 '  Did you forget to -e WORDPRESS_DB_PASSWORD=... ?'
		echo >&2
		echo >&2 '  (Also of interest might be WORDPRESS_DB_USER and WORDPRESS_DB_NAME.)'
		exit 1
	fi

	if ! [ -e index.php -a -e wp-includes/version.php ]; then
		echo >&2 "WordPress not found in $(pwd) - copying now..."
		if [ "$(ls -A)" ]; then
			echo >&2 "WARNING: $(pwd) is not empty - press Ctrl+C now if this is an error!"
			( set -x; ls -A; sleep 10 )
		fi
		tar cf - --one-file-system -C /usr/src/wordpress . | tar xf -
		echo >&2 "Complete! WordPress has been successfully copied to $(pwd)"
	fi
fi

# wp-config
if [ ! -e wp-config.php ]; then
  wp core config --allow-root --skip-check --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'SCRIPT_DEBUG', true );
define( 'WP_HOME', 'http://php'. PHP_MAJOR_VERSION . PHP_MINOR_VERSION .'.local' );
define( 'WP_SITEURL', 'http://php'. PHP_MAJOR_VERSION . PHP_MINOR_VERSION .'.local' );
PHP
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

# set up wordpress & plugins
if ! $(wp core is-installed --allow-root); then
  wp core install --allow-root --url=localhost --title=Localhost --admin_user=admin --admin_password=password --admin_email=support@wcpos.com
  wp plugin activate wordpress-importer --allow-root
  wp plugin activate woocommerce --allow-root
  wp plugin activate woocommerce-pos --allow-root
  wp import $(wp plugin path --allow-root)/woocommerce/dummy-data/dummy-data.xml --allow-root --skip=attachment --authors=create
  wp option update woocommerce_api_enabled yes --allow-root
  wp option update woocommerce_calc_taxes yes --allow-root
  wp rewrite structure '/%year%/%monthnum%/%postname%' --allow-root
#  wp rewrite flush --hard --allow-root
fi

exec "$@"