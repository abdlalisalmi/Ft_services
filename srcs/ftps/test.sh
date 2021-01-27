docker stop  $(docker ps -a -q)
docker rm  	 $(docker ps -a -q)
docker rmi  ftps
docker build -t ftps .  
docker run -p 21:21 -it ftps