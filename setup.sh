#!/bin/sh
# This script setup minikube, builds Docker images, and create pods

# Remove the old SSH certificate in the IMAC
ssh-keygen -R 192.168.99.103

echo "Deleting minikube..."
    minikube delete
echo "Starting minikube..."
    minikube start --driver=virtualbox --memory='3072'
    minikube dashboard &

echo "Install MetalLB"
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f ./srcs/yamls/metallb.yaml

echo "Building images..."
    eval $(minikube docker-env) # https://stackoverflow.com/questions/52310599/what-does-minikube-docker-env-mean
    docker build -t nginx_service ./srcs/nginx
    docker build -t mysql_service ./srcs/mysql
    docker build -t wordpress_service ./srcs/wordpress
    docker build -t phpmyadmin_service ./srcs/phpmyadmin
    docker build -t ftps_service ./srcs/ftps
    docker build -t influxdb_service ./srcs/influxdb
    docker build -t grafana_service ./srcs/grafana

echo "Creating pods and services..."
    kubectl apply -f ./srcs/yamls/nginx.yaml
    kubectl apply -f ./srcs/yamls/mysql.yaml
    kubectl apply -f ./srcs/yamls/wordpress.yaml
    kubectl apply -f ./srcs/yamls/phpmyadmin.yaml
    kubectl apply -f ./srcs/yamls/ftps.yaml
    kubectl apply -f ./srcs/yamls/influxdb.yaml
    kubectl apply -f ./srcs/yamls/grafana.yaml

    #/usr/share/grafana/data/grafana.db