#!/bin/sh

# Start telegraf
/usr/bin/telegraf &

# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE grafana_db"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON grafana_db TO admin"

# Keep container running
sleep infinity