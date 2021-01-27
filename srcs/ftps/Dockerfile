FROM alpine:latest

# install packages
RUN apk update
RUN apk add vsftpd lftp openrc --no-cache

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir /srv/ftp && chown nobody:nogroup /srv/ftp && echo "Test FTPS Server" | tee /srv/ftp/test.txt

RUN adduser -D user
RUN echo "user:password"|chpasswd

COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ./start.sh

#avoid container to stop
# CMD  ["sleep", "infinity"]
EXPOSE 21