# Update and install
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update
apk add nginx
apk add wget
apk add php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
apk add openssl
rm -rf /var/cache/apk/*

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
php-fpm7

sleep infinity
