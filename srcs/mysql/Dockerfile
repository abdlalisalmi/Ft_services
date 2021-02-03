FROM alpine:3.11

#in stall the packages
RUN apk update
RUN apk add mysql mysql-client
RUN apk add supervisor vim

# MySql configurations
COPY my.cnf /etc/my.cnf

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf

# Wordpress database
COPY wordpress_db.sql /wordpress_db.sql

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY start.sh /start.sh
RUN chmod +x start.sh

CMD ["sh", "start.sh"]

EXPOSE 3306