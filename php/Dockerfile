ARG php_version
FROM php:${php_version}-fpm

## build arguments
ARG xdebug_remote_autostart
ARG xdebug_remote_enable
ARG xdebug_remote_host
ARG xdebug_remote_port

ENV XDEBUG=xdebug
ENV GUZZLE=guzzle:5
ENV PHPUNIT=phpunit-5.7

RUN if [ "$PHP_VERSION" -lt "7.0" ]; then \
    export XDEBUG=xdebug-2.5.5; \
  elif [ "$PHP_VERSION" -lt "5.6" ]; then \
    export PHPUNIT=phpunit-old; \
  elif [ "$PHP_VERSION" -lt "5.5" ]; then \
    export XDEBUG=xdebug-2.4.1; \
  fi

## copy files from repository to container
COPY php/entrypoint.sh /entrypoint.sh
COPY fixtures.example.yml /fixtures.yml

## install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip subversion dos2unix \
  && rm -rf /var/lib/apt/lists/* \
  && pecl install $XDEBUG \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install mysqli

## xdebug options
RUN { \
  echo 'xdebug.remote_autostart=${xdebug_remote_autostart}'; \
  echo 'xdebug.remote_enable=${xdebug_remote_enable}'; \
  echo 'xdebug.remote_host=${xdebug_remote_host}'; \
  echo 'xdebug.remote_port=${xdebug_remote_port}'; \
} > /usr/local/etc/php/conf.d/xdebug.ini

## install composer
ENV PATH /root/.composer/vendor/bin:$PATH
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin \
  && composer global require guzzlehttp/$GUZZLE

## install phpunit
## force PHPUnit to 5.7, version 6 uses namespaces which casuses problems with WP Test Suite
RUN curl https://phar.phpunit.de/$PHPUNIT.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version

## add wp-cli for use in entrypoint, also fix permissions
RUN curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wp --info --allow-root \
  && dos2unix /entrypoint.sh \
  && chmod +x /entrypoint.sh

##
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
