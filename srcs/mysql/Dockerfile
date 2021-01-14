FROM alpine:latest

#in stall the packages
RUN apk update
RUN apk add mysql mysql-client

# MySql configurations
COPY my.cnf /etc/my.cnf

# Wordpress database
COPY wordpress_db.sql /wordpress_db.sql

COPY start.sh /start.sh
RUN chmod +x start.sh

CMD ["sh", "start.sh"]

EXPOSE 3306