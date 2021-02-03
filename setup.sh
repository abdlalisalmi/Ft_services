#!/bin/sh
# This script setup minikube, builds Docker images, and create pods

# Remove the old SSH certificate in the IMAC
ssh-keygen -R 192.168.99.103

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

# echo "Remove images..."
    docker rmi nginx_service
    docker rmi mysql_service
    docker rmi wordpress_service
    docker rmi phpmyadmin_service
    docker rmi ftps_service
    docker rmi influxdb_service
    docker rmi grafana_service

# echo "Building images..."
    docker build -t nginx_service ./srcs/nginx
    docker build -t mysql_service ./srcs/mysql
    docker build -t wordpress_service ./srcs/wordpress
    docker build -t phpmyadmin_service ./srcs/phpmyadmin

    docker build -t ftps_service ./srcs/ftps
    docker build -t influxdb_service ./srcs/influxdb

    docker build -t grafana_service ./srcs/grafana


# echo "Creating pods and services..."
    kubectl apply -f ./srcs/nginx.yaml
    kubectl apply -f ./srcs/mysql.yaml
    kubectl apply -f ./srcs/wordpress.yaml
    kubectl apply -f ./srcs/phpmyadmin.yaml

    kubectl apply -f ./srcs/ftps.yaml
    kubectl apply -f ./srcs/influxdb.yaml
    kubectl apply -f ./srcs/grafana.yaml