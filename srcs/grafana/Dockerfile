FROM alpine:3.13

COPY ./init.sh ./
COPY ./check.sh ./
COPY ./datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY ./dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY ./grafana.ini /usr/share/grafana/conf/custom.ini
COPY ./dashboards /var/lib/grafana/dashboards/
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 3000

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD /init.sh
