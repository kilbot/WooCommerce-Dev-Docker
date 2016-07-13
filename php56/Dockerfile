FROM php:5.6-fpm

# copy endpoint script
COPY docker-entrypoint.sh /entrypoint.sh

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip subversion \
  && rm -rf /var/lib/apt/lists/* \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install mysqli

# xdebug options
RUN { \
  echo 'xdebug.remote_enable=1'; \
  echo 'xdebug.remote_autostart=1'; \
  echo 'xdebug.remote_port=9000'; \
  echo 'xdebug.remote_host=172.22.0.1'; \
  echo 'xdebug.idekey=PHPSTORM'; \
} > /usr/local/etc/php/conf.d/xdebug.ini

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin
ENV PATH /root/.composer/vendor/bin:$PATH

# install phpunit
RUN curl https://phar.phpunit.de/phpunit.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version

ENV BUILD_TAG latest
ENV WORDPRESS_VERSION 4.5.3
ENV WORDPRESS_SHA1 835b68748dae5a9d31c059313cd0150f03a49269

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
  && echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
  && tar -xzf wordpress.tar.gz -C /usr/src/ \
  && rm wordpress.tar.gz \
  && mkdir /usr/src/wordpress/wp-content/plugins/woocommerce-pos \

# phpunit tests
RUN mkdir /usr/src/wordpress/wordpress-tests-lib \
  && svn co --quiet https://develop.svn.wordpress.org/tags/${WORDPRESS_VERSION}/tests/phpunit/includes/ /usr/src/wordpress/wordpress-tests-lib/includes \
  && curl -o /usr/src/wordpress/wordpress-tests-lib/wp-tests-config-sample.php https://develop.svn.wordpress.org/tags/${WORDPRESS_VERSION}/wp-tests-config-sample.php

# wordpress importer
RUN curl -o temp.zip -SL https://downloads.wordpress.org/plugin/wordpress-importer.zip \
  && unzip temp.zip -d /usr/src/wordpress/wp-content/plugins \
  && rm temp.zip

# woocommerce
ENV WOOCOMMERCE_VERSION 2.6.2

RUN curl -o temp.zip -SL https://downloads.wordpress.org/plugin/woocommerce.${WOOCOMMERCE_VERSION}.zip \
  && unzip temp.zip -d /usr/src/wordpress/wp-content/plugins \
  && rm temp.zip

# add wp-cli for use in entrypoint, also fix permissions
RUN curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wp --info --allow-root \
  && chown -R www-data:www-data /usr/src/wordpress \
  && chmod +x /entrypoint.sh

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]