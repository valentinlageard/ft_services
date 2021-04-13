# ft_services

A clustering project for 42.

## Cluster

![Cluster](diagram.png)

## Launch

`./setup.sh`

## Features

- Metallb is the only entry point.
- A wordpress CMS.
- A FTPS.
- A Grafana monitoring all pods.
- Mysql and Influxdb are persistent.
- All pods restart if one of their component fails using liveness probes.

## ID

- **Grafana** : admin / admin
- **PHPmyadmin** : wp_user / password
- **Wordpress** : salut / salut

## TODO

- Configurer metallb pour qu'il fonctionne dans la vm.
