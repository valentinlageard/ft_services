FROM alpine:3.13

COPY ./init.sh /init.sh
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 8086

RUN chmod +x /init.sh

CMD /init.sh
