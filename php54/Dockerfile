FROM php:5.4-fpm

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip \
  && rm -rf /var/lib/apt/lists/* \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install mysqli

# xdebug options
RUN { \
  echo 'xdebug.remote_enable=1'; \
  echo 'xdebug.remote_port=9000'; \
  echo 'xdebug.remote_host=172.22.0.1'; \
  echo 'xdebug.idekey=PHPSTORM'; \
} > /usr/local/etc/php/conf.d/xdebug.ini