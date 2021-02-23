FROM alpine:3.11

RUN apk update
RUN apk add supervisor
# Install Grafana
RUN apk add libc6-compat
COPY grafana-7.4.0.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN mv grafana-7.4.0 /usr/share/grafana

COPY grafana.db /usr/share/grafana/data/grafana.db

# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
RUN echo "python3 liveness.py telegraf grafana-server" > /startLiveness.sh
COPY liveness.py /liveness.py

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 3000