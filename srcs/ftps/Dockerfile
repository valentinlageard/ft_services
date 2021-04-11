FROM alpine:3.13

COPY ./init.sh /init.sh
COPY ./vsftpd.conf /tmp/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 21

RUN chmod +x /init.sh

CMD /init.sh
