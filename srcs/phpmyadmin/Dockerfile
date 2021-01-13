FROM alpine:latest

RUN apk update
RUN apk add supervisor
RUN apk add nginx
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
COPY nginx/nginx.conf /etc/nginx/nginx.conf

#SSL configuration
RUN mkdir /etc/nginx/ssl
RUN chown -R root:root /etc/nginx/ssl
RUN chmod -R 600 /etc/nginx/ssl
COPY nginx/ssl/localhost.crt /etc/nginx/ssl/localhost.crt
COPY nginx/ssl/localhost.key /etc/nginx/ssl/localhost.key

# PhpMyAdmin configuration
COPY phpMyAdmin-4.9.0.1-english.tar.gz /phpMyAdmin-4.9.0.1-english.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-english.tar.gz
RUN mv phpMyAdmin-4.9.0.1-english phpmyadmin
RUN cp -r phpmyadmin /var/www/html/


CMD ["supervisord", "-c", "/etc/supervisord.conf", "-s"]
# CMD ["nginx","-g","daemon off;"]

EXPOSE 5000