FROM alpine:3.13

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx
RUN apk add wget
RUN apk add php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add openssl
RUN apk add telegraf

COPY ./init.sh ./
COPY ./check.sh ./
COPY ./nginx.conf /tmp/nginx.conf
COPY ./phpmyadmin.conf.php /tmp/phpmyadmin.conf.php
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 5000

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD sh ./init.sh
