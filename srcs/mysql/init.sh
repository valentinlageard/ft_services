apk add telegraf

mysql_install_db --ldata=/var/lib/mysql

chown mysql:mysql -R /var/lib/mysql

ls /var/lib/mysql

mysqld --datadir="/var/lib/mysql" --default-authentication-plugin=mysql_native_password &

sleep 15

if ! test -d /var/lib/mysql/wordpress;
then
	echo 'create database wordpress' | mysql -u root --skip-password
	echo 'use wordpress; source /wordpress.sql;' | mysql -u root --skip-password
	echo 'wordpress database added to mysql'
fi

echo "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysql -h localhost
telegraf --config /etc/telegraf.conf

sleep infinity
