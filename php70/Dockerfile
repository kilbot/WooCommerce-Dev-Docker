FROM php:7.0-fpm

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

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin
ENV PATH /root/.composer/vendor/bin:$PATH

# install phpunit
RUN curl https://phar.phpunit.de/phpunit.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version