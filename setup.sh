# Launch minikube
minikube delete
minikube start

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb-config.yaml

# kubectl apply -k ./srcs/ # Need a kustomization.yaml for secrets

# Build
docker build -t wordpress srcs/wordpress

# Deploy
kubectl create -f ./srcs/wordpress.yaml

# Launch dashboard
minikube dashboard
