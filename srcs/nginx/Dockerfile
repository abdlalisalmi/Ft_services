FROM alpine:3.11

# install packages
RUN apk update
RUN apk add nginx openssh openssl supervisor --no-cache

# NGINX Configurations
# create the user that the web server will use
RUN adduser -D -g 'www' www
# setup the web server files and permitions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx
# Nginx config file and web page
COPY nginx.conf /etc/nginx/nginx.conf
COPY index/index.html /www/index.html
COPY index/index.css /www/index.css
COPY index/index.js /www/index.js
# SSL configuration
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# SSH Configurations
# We create SSH user and SSL key
RUN mkdir /var/run/sshd
RUN adduser -D user
RUN echo "user:password"|chpasswd
RUN ssh-keygen -A
RUN echo 'Welcome to SSH Mode (Ft-Services By aes-salm)' > /etc/motd

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf nginx sshd" > /startLiveness.sh
COPY liveness.py /liveness.py

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 80
EXPOSE 443
EXPOSE 22

