FROM alpine:3.13

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add mariadb mariadb-common mariadb-client
RUN apk add telegraf

COPY ./init.sh ./
COPY ./check.sh ./
COPY ./wordpress.sql ./
COPY ./my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./telegraf.conf /etc/telegraf.conf

EXPOSE 3306

RUN chmod +x /init.sh
RUN chmod +x /check.sh

CMD sh ./init.sh
