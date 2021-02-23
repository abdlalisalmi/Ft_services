# ft_services
> :warning: **Warning**: Don't copy/paste code you don't understand: it's bad for you, and for the school. I have put my login in a lot of files to encourage you doing your own version. Have fun !
## Introduction
42 cursus project, about kubernetes and docker, Ft_services will introduce you to Kubernetes. You will discover cluster management and
deployment with Kubernetes. You will virtualize a network and do "clustering".
### Docker:
Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.
#### Docker basics command:
```
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
## resources

### NGINX:
        [1] configure Nginx in Alpine server:
                https://wiki.alpinelinux.org/wiki/Nginx
        [2] Redirect and reverse proxy on Nginx:
                https://riptutorial.com/nginx/example/21680/redirect-vs-reverse-proxy
        [3] Generate SSL certificate:
                https://www.humankode.com/ssl/create-a-selfsigned-certificate-for-nginx-in-5-minutes
        [4] Delete SSH invalid key
                ssh-keygen -R "you server hostname or ip"

### FTPS:
        [1] AlpineLinux 3.6: Install vsftpd for FTP server
                https://www.hiroom2.com/2017/08/22/alpinelinux-3-6-vsftpd-en/
                https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/
        [2] Configure FTP to Use SSL/TLS
                https://www.digitalocean.com/community/tutorials/how-to-configure-vsftpd-to-use-ssl-tls-on-an-ubuntu-vps
