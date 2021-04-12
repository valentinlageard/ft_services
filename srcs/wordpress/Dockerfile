FROM alpine:3.13

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
