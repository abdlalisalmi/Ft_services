#! /bin/bash

#install and start services
mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
exec /usr/bin/mysqld -u root &
sleep 5

#create MySql database and admin
mysql -u root -e "CREATE DATABASE wordpress_db;CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';FLUSH PRIVILEGES;"
mysql -uroot  wordpress_db < wordpress_db.sql

# Run supervisord with configuration file
supervisord -c /etc/supervisord.conf

#avoid container to stop
sleep infinity