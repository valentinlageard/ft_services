# Install
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update
apk add influxdb
apk add telegraf

influxd & telegraf --config /etc/telegraf.conf

sleep infinity
