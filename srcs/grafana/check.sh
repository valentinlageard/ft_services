#!/bin/sh

if ! /bin/pidof grafana-server;
then exit 1
fi
