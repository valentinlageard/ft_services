# Update and install
apk update
apk add nginx
apk add openssl
rm -rf /var/cache/apk/*

# Generate self-signed certificate and key
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.pem -keyout /etc/ssl/private/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=vlageard/CN=localhost"

# Configure and start nginx
mv /tmp/nginx.conf /etc/nginx/conf.d/
mkdir /run/nginx
rm /etc/nginx/http.d/default.conf

nginx

sleep infinity
