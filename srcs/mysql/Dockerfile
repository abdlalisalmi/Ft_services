FROM alpine:latest

RUN apk update
RUN apk add supervisor mysql mysql-client

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf

COPY wordpress_db.sql /wordpress_db.sql



# CMD ["supervisord", "-c", "/etc/supervisord.conf", "-s"]
COPY start.sh /start.sh
RUN chmod +x start.sh

CMD ["sh", "start.sh"]

EXPOSE 3306