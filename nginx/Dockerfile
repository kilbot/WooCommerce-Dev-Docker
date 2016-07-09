FROM nginx

COPY *.conf /etc/nginx/conf.d/

# generate self signed ssl cert
RUN mkdir /etc/nginx/ssl \
  && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
  -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"

EXPOSE 80 443