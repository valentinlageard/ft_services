# Install
apk update
apk add openssl vsftpd

# Generate key
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.pem -keyout /etc/ssl/private/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=vlageard/CN=localhost"

# Launch ftps server
rm /etc/vsftpd/vsftpd.conf
cp /tmp/vsftpd.conf /etc/vsftpd/
vsftpd /etc/vsftpd/vsftpd.conf

sleep infinity
