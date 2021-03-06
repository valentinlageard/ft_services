# Generate self-signed certificate and key
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.pem -keyout /etc/ssl/private/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=vlageard/CN=localhost"

# Download and set up phpmyadmin
cd /tmp
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin
cd /
mv /tmp/phpmyadmin.conf.php /var/www/phpmyadmin
rm /var/www/phpmyadmin/config.sample.inc.php
mv /var/www/phpmyadmin/phpmyadmin.conf.php /var/www/phpmyadmin/config.inc.php

# Configure and start NGINX
mv /tmp/nginx.conf /etc/nginx/conf.d/
rm /etc/nginx/http.d/default.conf
mkdir /run/nginx
nginx

# Launch php
php-fpm7 & telegraf --config /etc/telegraf.conf

sleep infinity
