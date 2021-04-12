#!/bin/sh

if ! test -f /var/run/nginx/nginx.pid;
then exit 1
fi

if ! /bin/pidof php-fpm7;
then exit 1
fi
