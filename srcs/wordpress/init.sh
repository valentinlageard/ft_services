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
rm /var/www/localhost/wordpress/wp-config-sample.php
chmod -R 755 /var/www/*
cd /

# Add run/nginx
mkdir /run/nginx

# Start NGINX
nginx

# Start PHP
php-fpm7 & telegraf --config /etc/telegraf.conf

sleep infinity
