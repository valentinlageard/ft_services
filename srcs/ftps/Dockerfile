FROM alpine:3.13

COPY ./init.sh /init.sh
COPY ./check.sh ./
COPY ./vsftpd.conf /tmp/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 21

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD /init.sh
