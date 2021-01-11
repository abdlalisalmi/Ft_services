FROM alpine:latest

# install packages
RUN apk update
RUN apk add nginx

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
COPY ssl/localhost.crt /etc/nginx/ssl/localhost.crt
COPY ssl/localhost.key /etc/nginx/ssl/localhost.key

# Nginx config file and web page
COPY nginx.conf /etc/nginx/nginx.conf
COPY index/index.html /www/index.html
COPY index/index.css /www/index.css
COPY index/index.js /www/index.js

CMD ["nginx","-g","daemon off;"]

EXPOSE 80
EXPOSE 443
EXPOSE 22

