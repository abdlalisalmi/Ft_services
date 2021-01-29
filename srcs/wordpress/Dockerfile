FROM alpine:3.11

RUN apk update
RUN apk add supervisor openssl
RUN apk add nginx
RUN apk add wget curl php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

# create the user that the web server will use
RUN adduser -D -g 'www' www

# RUN rc-update add php-fpm7 && rc-status && touch /run/openrc/softlevel && rc-service php-fpm7 start

# setup the web server files and permissions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf

# Nginx config file and web page
COPY nginx.conf /etc/nginx/nginx.conf

# Wordpress configuration
COPY wordpress.tar.gz ./
RUN tar -xvf wordpress.tar.gz
RUN cp -r wordpress /var/www/html/
RUN rm wordpress.tar.gz
# RUN rm /var/www/html/wordpress/wp-config-sample.php
COPY wp-config.php /var/www/html/


CMD ["supervisord", "-c", "/etc/supervisord.conf"]
# CMD ["nginx","-g","daemon off;"]

EXPOSE 5050