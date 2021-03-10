FROM alpine:3.13

RUN apk update
RUN apk add nginx
RUN apk add wget

COPY ./init.sh ./
COPY ./nginx-conf ./tmp/nginx-conf
COPY ./wp-config.php ./tmp/wp-config.php

EXPOSE 5050

CMD bash ./init.sh
