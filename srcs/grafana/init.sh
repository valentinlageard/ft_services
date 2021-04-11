# Install
apk update
apk add grafana
apk add telegraf

grafana-server --homepath=/usr/share/grafana/ & telegraf --config /etc/telegraf.conf
