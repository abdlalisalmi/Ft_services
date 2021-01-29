#!/bin/sh
# This script setup minikube, builds Docker images, and create pods

echo "Starting minikube..."
    minikube start --driver=virtualbox
    eval $(minikube docker-env) # https://stackoverflow.com/questions/52310599/what-does-minikube-docker-env-mean
    # minikube addons enable metrics-server
    minikube addons enable dashboard
    minikube dashboard &


# echo "[2] Enabling addons..."
# minikube addons enable ingress  # An Ingress is an API object that defines rules which allow external access to services in a cluster

echo "Install MetalLB"
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f metallb.yaml

# echo "Building images..."
#     docker build -t nginx_service ./srcs/nginx
#     docker build -t wordpress_service ./srcs/wordpress
#     docker build -t phpmyadmin_service ./srcs/phpmyadmin
#     docker build -t mysql_service ./srcs/mysql


# echo "Creating pods and services..."
#     kubectl apply -f ./srcs/nginx.yaml
#     kubectl apply -f ./srcs/wordpress.yaml
#     kubectl apply -f ./srcs/phpmyadmin.yaml
#     kubectl apply -f ./srcs/mysql.yaml