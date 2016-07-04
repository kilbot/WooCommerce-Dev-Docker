FROM wordpress:latest

#ENV WOOCOMMERCE_VERSION 2.6.1
#ENV WOOCOMMERCE_UPSTREAM_VERSION 2.6.1

RUN apt-get update
RUN apt-get install -y --no-install-recommends unzip wget

# woocommerce
RUN wget https://downloads.wordpress.org/plugin/woocommerce.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip