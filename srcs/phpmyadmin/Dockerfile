FROM alpine:3.13

COPY ./init.sh ./
COPY ./check.sh ./
COPY ./nginx.conf /tmp/nginx.conf
COPY ./phpmyadmin.conf.php /tmp/phpmyadmin.conf.php
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 5000

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD sh ./init.sh
