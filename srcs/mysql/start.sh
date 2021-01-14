#! /bin/bash

#create necessary folders
mkdir -p /var/lib/mysql /run/mysqld/

#install and start services
mysql_install_db -u root > /dev/null
exec /usr/bin/mysqld -u root &

sleep 5

#create db admin
mysql -uroot -e 'CREATE DATABASE wordpress_db;'
mysql -uroot -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;"
mysql -uroot -e "USE wordpress_db;"
mysql -uroot -e "DROP DATABASE test;"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uadmin -padmin  wordpress_db < wordpress_db.sql


#avoid container to stop
sleep infinity