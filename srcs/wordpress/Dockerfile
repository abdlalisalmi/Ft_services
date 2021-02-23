FROM alpine:3.11

RUN apk update
RUN apk add supervisor openssl
RUN apk add nginx
RUN apk add wget curl php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

# NGINX Configurations
# create the user that the web server will use
RUN adduser -D -g 'www' www
# setup the web server files and permissions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx
# Nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

# Wordpress configuration
COPY wordpress.tar.gz ./
RUN tar -xvf wordpress.tar.gz
RUN cp -r wordpress /var/www/html/
RUN rm wordpress.tar.gz
COPY wp-config.php /var/www/html/

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf nginx php-fpm7" > /startLiveness.sh
COPY liveness.py /liveness.py

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 5050