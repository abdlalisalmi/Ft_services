docker stop  $(docker ps -a -q)
docker rm  	 $(docker ps -a -q)
docker rmi  mysql
docker build -t mysql .  
docker run -p 3306:3306 -it mysql