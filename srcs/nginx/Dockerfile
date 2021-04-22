FROM alpine:3.13

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN apk add telegraf

COPY ./init.sh ./
COPY ./check.sh ./
COPY ./nginx.conf /tmp/nginx.conf
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 80
EXPOSE 443

RUN chmod +x /init.sh
RUN chmod +x /check.sh
CMD sh ./init.sh
