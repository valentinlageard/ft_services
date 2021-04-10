FROM alpine:3.13

COPY ./init.sh /init.sh
COPY ./influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY ./grafana.ini /usr/share/grafana/conf/custom.ini

EXPOSE 3000

RUN chmod +x /init.sh

CMD /init.sh
