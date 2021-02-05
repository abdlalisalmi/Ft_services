FROM alpine:3.11

# Install Grafana
RUN apk update
RUN apk add grafana --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community

COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
# COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
# COPY dashboards/*.json /usr/share/grafana/conf/provisioning/dashboards/


# Telegraf setup
RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf


COPY start.sh /start.sh
RUN chmod +x start.sh
CMD ./start.sh

EXPOSE 3000