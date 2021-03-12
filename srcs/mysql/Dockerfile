FROM alpine:3.13

RUN apk update && apk add mariadb mariadb-common mariadb-client

COPY ./my.cnf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

COPY ./init.sh /init.sh
RUN chmod +x /init.sh

CMD sh ./init.sh
