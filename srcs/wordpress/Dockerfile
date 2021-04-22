FROM alpine:3.13

RUN apk update
RUN apk add nginx
RUN apk add wget
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add openssl
RUN apk add telegraf

COPY ./init.sh ./
COPY ./check.sh ./
COPY ./nginx.conf /tmp/nginx.conf
COPY ./wordpress /tmp/wordpress
COPY ./wp-config.php /tmp/wp-config.php
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 5050

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD sh ./init.sh
