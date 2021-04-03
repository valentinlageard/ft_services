FROM alpine:3.13

COPY ./init.sh ./
COPY ./nginx.conf /tmp/nginx.conf

EXPOSE 80
EXPOSE 443

CMD sh ./init.sh
