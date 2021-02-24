# ft_services
> :warning: **Warning**: Don't copy/paste code you don't understand: it's bad for you, and for the school. I have put my login in a lot of files to encourage you doing your own version. Have fun !
## Introduction
42 cursus project, about kubernetes and docker, Ft_services will introduce you to Kubernetes. You will discover cluster management and
deployment with Kubernetes. You will virtualize a network and do "clustering".
The project consists of setting up an infrastructure of different services. To do this, you must use Kubernetes. You will need to set up a multi-service cluster.
Each service will have to run in a dedicated container.
Each container must bear the same name as the service concerned and for performance reasons, containers have to be build using Alpine Linux.
Also, they will need to have a Dockerfile written by you which is called in the setup.sh.
You will have to build yourself the images that you will use. It is forbidden to take already build images or use services like DockerHub.
### :one: Docker:
Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.
#### Docker basics command :white_check_mark:
```sh
# Build a docker image from a Dockerfile
docker build -t <your image name> <your Dockerfile dir>

# Start an instance of a docker image
docker run -it <your image name>
# Really important if you want to bind some ports on the container to your own computer, use -p option.
# Exemple for an Apache image using port 80 in the container as our port 80
docker run -it debian:apache -p80:80

# See all images
docker images

# See running containers
docker ps

# Stop a container
docker kill <container ID>

# Delete all unused Docker images and cache and free SO MUCH SPACE on your computer
docker system prune
```
### :two: Kubernetes:
Kubernetes is a portable, extensible, open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.
#### Kubernetes basics command :white_check_mark:
```sh
# Start Minikube
minikube start

# Launch minikube dashboard
minikube dashboard

# Reset Minikube VM
minikube delete

# Create a pod from a YAML file
kubectl create -f <yourfile.yaml>

# Get the pod full name:
kubectl get pods

# Delete a pod
kubectl delete pod <pod name>

# Get a shell in a pod
kubectl exec -it <pod name> -- sh

# Copy data from our computer to pod:
kubectl cp <name space>/<pod name>:<file path> <destination path>

# Copy data from pod to our computer:
kubectl cp <file path> <pod name>:<destination path>
```
## Containers (services):
### Nginx
NGINX is open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability. In addition to its HTTP server capabilities, NGINX can also function as a proxy server for email (IMAP, POP3, and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers.

### FTPs
A simple FTPs server. FTP is a protocol to send and download files from a distant computer. FTPs is a version that uses SSL to encrypt communications between the client and the server, which is safer. Pure-FTPD is a simple FTP server. You can test a FTP connection with:

### Wordpress
Wordpress is the #1 open source website and blog content manager. It's written in PHP, and uses MySQL as database. Wordpress need a web server to work, we can Nginx for that.

### PHPMyAdmin
PHPMyAdmin is a useful tool to view, query, and edit data from a MySQL database. It can be hosted by any web server, so I recommand you to use Nginx as well as you've used it before.

### MySQL
MySQL is an open-source relational database management system. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language.
### InfluxDB
InfluxDB is an open-source time series database developed by InfluxData. It is written in Go and optimized for fast, high-availability storage and retrieval of time series data in fields such as operations monitoring, application metrics, Internet of Things sensor data, and real-time analytics.
### Grafana
Grafana is a multi-platform open source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources. Grafana Enterprise version with additional capabilities is also available. It is expandable through a plug-in system.

## Useful resources :link:

### NGINX:
1. configure Nginx in Alpine server :
    - https://wiki.alpinelinux.org/wiki/Nginx
2. Redirect and reverse proxy on Nginx :
    - https://riptutorial.com/nginx/example/21680/redirect-vs-reverse-proxy
4. Generate SSL certificate :
    - https://www.humankode.com/ssl/create-a-selfsigned-certificate-for-nginx-in-5-minutes

### FTPS:
1. Install vsftpd for FTP server :
    - https://www.hiroom2.com/2017/08/22/alpinelinux-3-6-vsftpd-en/
    - https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/
2. Configure FTP to Use SSL/TLS : 
    - https://www.digitalocean.com/community/tutorials/how-to-configure-vsftpd-to-use-ssl-tls-on-an-ubuntu-vps
