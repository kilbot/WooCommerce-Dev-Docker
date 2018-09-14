FROM php:7.2-fpm

# build arguments
ARG xdebug_remote_autostart
ARG xdebug_remote_connect_back
ARG xdebug_remote_enable
ARG xdebug_remote_host
ARG xdebug_remote_port

# copy files from repository to container
COPY php72/docker-entrypoint.sh /entrypoint.sh
COPY bin/entrypoint-common.sh /entrypoint-common.sh
COPY fixtures.example.yml /var/www/html/fixtures.yml

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip subversion dos2unix \
  && rm -rf /var/lib/apt/lists/* \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install mysqli

# xdebug options
RUN { \
  echo 'xdebug.remote_autostart=${xdebug_remote_autostart}'; \
  echo 'xdebug.remote_connect_back=${xdebug_remote_connect_back}'; \
  echo 'xdebug.remote_enable=${xdebug_remote_enable}'; \
  echo 'xdebug.remote_host=${xdebug_remote_host}'; \
  echo 'xdebug.remote_port=${xdebug_remote_port}'; \
} > /usr/local/etc/php/conf.d/xdebug.ini

# install composer
ENV PATH /root/.composer/vendor/bin:$PATH
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin \
  && composer global require guzzlehttp/guzzle:5

# install phpunit
# force PHPUnit to 5.7, version 6 uses namespaces which casuses problems with WP Test Suite
RUN curl https://phar.phpunit.de/phpunit-5.7.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version

# add wp-cli for use in entrypoint, also fix permissions
RUN curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wp --info --allow-root \
  && dos2unix /entrypoint.sh \
  && dos2unix /entrypoint-common.sh \
  && chmod +x /entrypoint.sh \
  && chmod +x /entrypoint-common.sh

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
