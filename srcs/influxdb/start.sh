#!/bin/sh

# Start influxdb
/usr/sbin/influxd & sleep 3

# Run supervisord with configuration file
supervisord -c /etc/supervisord.conf

# Keep container running
sleep infinity