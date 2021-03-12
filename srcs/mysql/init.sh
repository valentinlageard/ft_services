mysql_install_db --ldata=/var/lib/mysql;
mysqld --datadir="/var/lib/mysql" &
sleep 5;
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'root'@'%' IDENTIFIED BY '';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

sh
