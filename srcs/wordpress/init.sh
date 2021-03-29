# Update and install
apk update
apk add nginx
apk add wget
apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
apk add openssl
rm -rf /var/cache/apk/*

# Create website folder and an index for it
touch /var/www/localhost/index.php
echo "<?php phpinfo(); ?>" >> /var/www/localhost/index.php

# Generate self-signed certificate and key
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.pem -keyout /etc/ssl/private/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=vlageard/CN=localhost"

# Configure nginx
mv /tmp/nginx.conf /etc/nginx/conf.d/

# Install and config WORDPRESS
mv /tmp/wordpress /var/www/localhost
mv /tmp/wp-config.php /var/www/localhost/wordpress
cd /var/www/localhost/wordpress
ls
rm /var/www/localhost/wordpress/wp-config-sample.php
chmod -R 755 /var/www/*
cd /

# Add run/nginx
mkdir /run/nginx

# Start NGINX
nginx

# Start PHP
php-fpm7

sleep infinity
