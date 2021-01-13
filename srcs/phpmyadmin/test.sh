docker stop  $(docker ps -a -q)
docker rm  	 $(docker ps -a -q)
docker rmi  phpmyadmin
docker build -t phpmyadmin .  
docker run -p 5000:80 -it phpmyadmin