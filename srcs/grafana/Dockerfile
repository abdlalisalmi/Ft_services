FROM alpine:3.11

RUN apk update
RUN apk add supervisor
# Install Grafana
RUN apk add libc6-compat
COPY grafana-7.4.0.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN mv grafana-7.4.0 /usr/share/grafana


COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY dashboards/*.json /usr/share/grafana/conf/provisioning/dashboards/


# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copy Liveness Probe script
COPY liveness.py /liveness.py

# copy supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 3000