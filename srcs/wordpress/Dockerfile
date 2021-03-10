FROM alpine:3.13

COPY ./install.sh ./
COPY ./init.sh ./
COPY ./nginx.conf /tmp/nginx.conf
COPY ./wp-config.php /tmp/wp-config.php

EXPOSE 80
EXPOSE 443

RUN chmod +x ./install.sh && ./install.sh

CMD sh ./init.sh
