
rc-update add vsftpd default && rc-status && touch /run/openrc/softlevel && rc-service vsftpd start

#avoid container to stop
sleep infinity