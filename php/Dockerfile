ARG php_version
FROM php:${php_version}-fpm

LABEL version="1.0"
LABEL name="PHP"
LABEL description="PHP with xdebug, phpunit, guzzle, composer and mailhog"

## build arguments, note: php_version gets reset after FROM, required again here
ARG php_version
ARG xdebug_remote_autostart
ARG xdebug_remote_enable
ARG xdebug_remote_host
ARG xdebug_remote_port

## PHPUNIT 6 uses namespaces, which messes with WP Test Suite
ENV GUZZLE_VERSION=6
ENV PHPUNIT_VERSION=5

## copy files from repository to container root
COPY php/entrypoint.sh php/wp-cli.template.yml php/index.php fixtures.example.yml /

## install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip subversion dos2unix ssmtp \
  && rm -rf /var/lib/apt/lists/* \
  && \
    if [ "${php_version%%.*}" -lt "7" ]; then \
      pecl install xdebug-2.5.5; \
    else \
      pecl install xdebug; \ 
    fi \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install mysqli \
  && apt-get clean

## PHP config files
RUN sed -i "s|mailhub=mail|mailhub=mailhog:1025|g" /etc/ssmtp/ssmtp.conf \
  && { \
    echo 'log_errors=1'; \
    echo 'error_reporting=E_ALL'; \
    echo 'error_log=/var/www/html/php_error.log'; \
    echo 'memory_limit=512M'; \
    echo 'sendmail_path=/usr/sbin/ssmtp -t -i'; \
    echo 'xdebug.remote_autostart='${xdebug_remote_autostart}; \
    echo 'xdebug.remote_enable='${xdebug_remote_enable}; \
    echo 'xdebug.remote_host='${xdebug_remote_host}; \
    echo 'xdebug.remote_port='${xdebug_remote_port}; \
  } > /usr/local/etc/php/conf.d/custom.ini

## install composer and wp-cli
ENV PATH /root/.composer/vendor/bin:$PATH
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin \
  && composer global require guzzlehttp/guzzle ^${GUZZLE_VERSION} \
  && composer global require phpunit/phpunit ^${PHPUNIT_VERSION} \
  && phpunit --version \
  && curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wp --info --allow-root \
  && dos2unix /entrypoint.sh \
  && chmod +x /entrypoint.sh

##
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
