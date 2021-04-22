FROM alpine:3.13

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add influxdb
RUN apk add telegraf

COPY ./init.sh /init.sh
COPY ./check.sh ./
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 8086

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD /init.sh
