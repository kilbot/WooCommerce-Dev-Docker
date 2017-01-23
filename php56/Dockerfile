FROM php:5.6-fpm

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
  echo 'xdebug.remote_host=remote_host'; \
} > /usr/local/etc/php/conf.d/xdebug.ini

# install composer
ENV PATH /root/.composer/vendor/bin:$PATH
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin \
  && composer global require guzzlehttp/guzzle:5

# install phpunit
RUN curl https://phar.phpunit.de/phpunit.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version

# copy endpoint script
COPY docker-entrypoint.sh /entrypoint.sh
# ADD https://raw.githubusercontent.com/kilbot/WooCommerce-Dev-Docker/master/bin/entrypoint-common.sh /

# add wp-cli for use in entrypoint, also fix permissions
RUN curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wp --info --allow-root \
  && chmod +x /entrypoint.sh
  # && chmod +x /entrypoint-common.sh

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]