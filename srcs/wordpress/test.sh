docker stop  $(docker ps -a -q)
docker rm  	 $(docker ps -a -q)
docker rmi  wordpress
docker build -t wordpress .  
docker run -p 80:80 -p 443:443 -p 3306:3306 -it wordpress