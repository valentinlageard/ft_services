# Launch minikube
minikube delete
minikube start --vm-driver=docker
eval $(minikube docker-env)

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f ./srcs/metallb-config.yaml

#kubectl apply -k ./srcs/ # Need a kustomization.yaml for secrets

# Build
docker build -t nginx_img srcs/nginx
docker build -t mysql_img srcs/mysql
docker build -t wordpress_img srcs/wordpress
docker build -t phpmyadmin_img srcs/phpmyadmin
docker build -t ftps_img srcs/ftps
docker build -t influxdb_img srcs/influxdb
docker build -t grafana_img srcs/grafana

DB_NAME=wordpress;
DB_USER=wp_user;
DB_PASSWORD=password;
DB_HOST=mysql;

kubectl create secret generic mysql-id \
	--from-literal=name=${DB_NAME} \
	--from-literal=user=${DB_USER} \
	--from-literal=password=${DB_PASSWORD} \
	--from-literal=host=${DB_HOST}

# Deploy
kubectl create -f ./srcs/nginx.yaml
kubectl create -f ./srcs/mysql.yaml
kubectl create -f ./srcs/wordpress.yaml
kubectl create -f ./srcs/phpmyadmin.yaml
kubectl create -f ./srcs/ftps.yaml
kubectl create -f ./srcs/influxdb.yaml
kubectl create -f ./srcs/grafana.yaml

# Launch dashboard
minikube dashboard
