FROM alpine:3.13

COPY ./init.sh ./
COPY ./nginx.conf /tmp/nginx.conf
COPY ./phpmyadmin.conf.php /tmp/phpmyadmin.conf.php

EXPOSE 5000

CMD sh ./init.sh
