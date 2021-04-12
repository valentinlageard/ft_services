#!/bin/sh

if ! /bin/pidof influxd;
then exit 1
fi
