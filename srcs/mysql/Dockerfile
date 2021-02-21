FROM alpine:3.11

#in stall the packages
RUN apk update
RUN apk add mysql mysql-client
RUN apk add supervisor vim

# Wordpress database
COPY wordpress_db.sql /wordpress_db.sql

########### MySql configurations ###########
COPY my.cnf /etc/my.cnf
#create necessary folders
RUN mkdir -p /var/lib/mysql /run/mysqld/

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf mysqld" > /startLiveness.sh
COPY liveness.py /liveness.py

# copy and run supervisord with configuration file
COPY supervisord.conf /etc/supervisord.conf
# CMD ["supervisord", "-c", "/etc/supervisord.conf"]

COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ["sh", "start.sh"]

EXPOSE 3306