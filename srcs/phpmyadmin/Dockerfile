FROM alpine:3.11

RUN apk update
RUN apk add supervisor
RUN apk add nginx openssl
RUN apk add wget curl php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

# create the user that the web server will use
RUN adduser -D -g 'www' www

# setup the web server files and permissions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf

# Nginx config file and web page
COPY nginx.conf /etc/nginx/nginx.conf

# PhpMyAdmin configuration
COPY phpMyAdmin-4.9.0.1-english.tar.gz /phpMyAdmin-4.9.0.1-english.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-english.tar.gz
RUN mv phpMyAdmin-4.9.0.1-english phpmyadmin
RUN cp -r phpmyadmin /var/www/html/
RUN mkdir var/www/html/tmp
RUN chmod 777 var/www/html/tmp

# PHPMyAdmin config file
COPY phpmyadmin.inc.php /var/www/html/config.inc.php

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf nginx php-fpm7" > /startLiveness.sh
COPY liveness.py /liveness.py

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
# CMD ["nginx","-g","daemon off;"]

EXPOSE 5000