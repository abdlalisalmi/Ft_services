FROM alpine:3.11

# install packages
RUN apk update
RUN apk add vsftpd openrc openssl --no-cache

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir /srv/ftp && chown nobody:nogroup /srv/ftp && echo "Test FTPS Server" | tee /srv/ftp/test.txt

RUN adduser -D user
RUN echo "user:password"|chpasswd

# Create SSL key to activate ftpS
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ./start.sh

#avoid container to stop
# CMD  ["sleep", "infinity"]
EXPOSE 21