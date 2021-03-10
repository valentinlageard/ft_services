# Create website folder and an index for it
mkdir /var/www/mywebsite #&& touch /var/www/mywebsite/index.php ;
#echo "<?php phpinfo(); ?>" >> /var/www/mywebsite/index.php ;

# Instal PHP
RUN apk update && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Generate self-signed certificate and key
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/mywebsite.pem -keyout /etc/ssl/private/mywebsite.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=vlageard/CN=mywebsite" ;

# Config and start NGINX
mv ./tmp/nginx-conf /etc/nginx/sites-available/mywebsite ;
ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/mywebsite ;
rm -rf /etc/nginx/sites-enabled/default ;
service nginx start ;

# Install and config WORDPRESS
mkdir /var/www/mywebsite/wordpress ;
cd /tmp ;
wget -c https://wordpress.org/latest.tar.gz ;
tar -xvf latest.tar.gz --strip-components=1 -C /var/www/mywebsite/wordpress ;
mv /tmp/wp-config.php /var/www/mywebsite/wordpress ;
rm /var/www/mywebsite/wordpress/wp-config-sample.php ;
chown -R www-data /var/www/* ;
chmod -R 755 /var/www/* ;
cd / ;

bash ;
