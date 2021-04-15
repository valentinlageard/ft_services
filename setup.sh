# Stop default nginx
sudo service nginx stop

# Update minikube
curl -LO https://github.com/kubernetes/minikube/releases/download/v1.19.0/minikube_1.19.0-0_amd64.deb
sudo rm -f /usr/local/bin/minikube 
sudo apt install ./minikube_1.19.0-0_amd64.deb

# Update kubectl
sudo rm -f /usr/local/bin/kubectl
curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo cp kubectl /usr/local/bin

# Launch minikube
minikube stop
minikube delete
minikube start --vm-driver=docker
eval $(minikube docker-env)

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb-config.yaml

# Build
docker build -t influxdb_img srcs/influxdb
docker build -t mysql_img srcs/mysql
docker build -t nginx_img srcs/nginx
docker build -t wordpress_img srcs/wordpress
docker build -t phpmyadmin_img srcs/phpmyadmin
docker build -t ftps_img srcs/ftps
docker build -t grafana_img srcs/grafana

# Deploy
kubectl create -f ./srcs/influxdb.yaml
kubectl create -f ./srcs/mysql.yaml
kubectl create -f ./srcs/nginx.yaml
kubectl create -f ./srcs/wordpress.yaml
kubectl create -f ./srcs/phpmyadmin.yaml
kubectl create -f ./srcs/ftps.yaml
kubectl create -f ./srcs/grafana.yaml

# Launch dashboard
minikube dashboard
