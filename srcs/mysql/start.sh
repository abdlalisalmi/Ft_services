#! /bin/bash

# Wait that mysql was up
# until mysql
# do
# 	echo "NO_UP"
# done

/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"


mysql -uroot -proot -e "CREATE DATABASE wordpress_db"
mysql -uroot -proot -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin'"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost'"
mysql -uadmin -padmin  wordpress_db <wordpress_db.sql


# Init DB
# echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
# echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
# echo "DROP DATABASE test" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# mysql wordpress -u root --password=  < wordpress.sql

supervisord -c /etc/supervisord.conf -s