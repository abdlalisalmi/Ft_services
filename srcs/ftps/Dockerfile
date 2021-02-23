FROM alpine:3.11

# install packages
RUN apk update
RUN apk add supervisor
RUN apk add vsftpd openrc openssl --no-cache

# FTPS Configurations
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
# Create ftps user
RUN adduser -D user
RUN echo "user:password"|chpasswd
# Create SSL key to activate ftpS
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf vsftpd" > /startLiveness.sh
COPY liveness.py /liveness.py

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf
CMD  ["supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 21 21010 21011