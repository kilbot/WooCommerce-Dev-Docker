FROM nginx

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY wait-for-it.sh /wait-for-it.sh

# generate self signed ssl cert
RUN apt-get update \
  && apt-get install -y --no-install-recommends openssl dos2unix \
  && mkdir /etc/nginx/ssl \
  && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
  -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"

RUN dos2unix /wait-for-it.sh \
  && chmod +x /wait-for-it.sh
