FROM alpine:3.11

# install packages
RUN apk update
RUN apk add supervisor
RUN apk add influxdb --no-cache
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community

# Telegraf setup
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf influxd" > /startLiveness.sh
COPY liveness.py /liveness.py

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf

COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ./start.sh
EXPOSE 8086