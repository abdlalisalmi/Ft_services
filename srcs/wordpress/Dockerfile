FROM alpine:latest

RUN apk update
RUN apk add openrc
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache

# create the user that the web server will use
RUN adduser -D -g 'www' www

# setup the web server files and permitions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

#SSL configuration
RUN mkdir /etc/nginx/ssl
RUN chown -R root:root /etc/nginx/ssl
RUN chmod -R 600 /etc/nginx/ssl
COPY nginx/ssl/localhost.crt /etc/nginx/ssl/localhost.crt
COPY nginx/ssl/localhost.key /etc/nginx/ssl/localhost.key

# Nginx config file and web page
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Wordpress configuration
COPY wordpress.tar.gz ./
RUN tar -xvf wordpress.tar.gz
RUN cp -r wordpress /var/www/html/
RUN rm wordpress.tar.gz
# RUN rm /var/www/html/wordpress/wp-config-sample.php
# COPY wp-config.php /var/www/html/wordpress/



CMD ["nginx","-g","daemon off;"]

EXPOSE 5050
EXPOSE 80