FROM alpine:3.13

RUN apk update
RUN apk add openssl vsftpd
RUN apk add telegraf

COPY ./init.sh /init.sh
COPY ./check.sh ./
COPY ./vsftpd.conf /tmp/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 21 20000-20004

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD /init.sh
