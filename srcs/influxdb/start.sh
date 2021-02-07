#!/bin/sh


# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE grafana_db"
influx -execute "CREATE USER admin WITH PASSWORD 'admin'"
influx -execute "GRANT ALL ON grafana_db TO admin"


# Run supervisord with configuration file
supervisord -c /etc/supervisord.conf


# Keep container running
sleep infinity