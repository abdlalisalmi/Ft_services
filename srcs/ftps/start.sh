
rc-update add vsftpd default && rc-status && touch /run/openrc/softlevel && rc-service vsftpd start

# Run supervisord with configuration file
supervisord -c /etc/supervisord.conf

#avoid container to stop
sleep infinity