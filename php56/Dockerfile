FROM php:5.6-fpm

# copy endpoint script
COPY docker-entrypoint.sh /entrypoint.sh

# install the PHP extensions we need
RUN apt-get update && apt-get install -y unzip libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mysqli opcache

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

ENV BUILD_TAG latest
ENV WORDPRESS_VERSION 4.5.3
ENV WORDPRESS_SHA1 835b68748dae5a9d31c059313cd0150f03a49269

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
	&& tar -xzf wordpress.tar.gz -C /usr/src/ \
	&& rm wordpress.tar.gz

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