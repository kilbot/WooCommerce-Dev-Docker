ARG php_version
FROM php:${php_version}-fpm

## build arguments
ARG xdebug_remote_autostart
ARG xdebug_remote_enable
ARG xdebug_remote_host
ARG xdebug_remote_port

## PHPUNIT 6 uses namespaces, which messes with WP Test Suite
ENV XDEBUG_VERSION=xdebug
ENV GUZZLE_VERSION=5
ENV PHPUNIT_VERSION=5

RUN if [ "$php_version" = "5.6" ]; then \
  export XDEBUG_VERSION=xdebug-2.5.5; \
fi

## copy entrypoint from repository to container
COPY php/entrypoint.sh /entrypoint.sh
COPY php/wp-cli.template.yml /wp-cli.template.yml
COPY php/index.php /index.php
COPY fixtures.example.yml /fixtures.example.yml

## install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip subversion dos2unix ssmtp \
  && rm -rf /var/lib/apt/lists/* \
  && pecl install $XDEBUG_VERSION \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install mysqli

## PHP configuration
RUN { \
  echo 'log_errors=1'; \
  echo 'error_reporting=E_ALL'; \
  echo 'error_log=/var/www/html/php_error.log'; \
  echo 'memory_limit=512M'; \
  echo 'sendmail_path=/usr/sbin/ssmtp -t -i'; \
} > /usr/local/etc/php/conf.d/custom.ini

## mail config
RUN sed -i "s|mailhub=mail|mailhub=mailhog:1025|g" /etc/ssmtp/ssmtp.conf

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
  && composer global require guzzlehttp/guzzle ^${GUZZLE_VERSION} \
  && composer global require phpunit/phpunit ^${PHPUNIT_VERSION} \
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
