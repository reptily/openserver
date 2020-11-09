docker stop webserver
docker rm webserver

docker stop app
docker rm app
docker rmi openweb/php:5.4
docker rmi openweb/php:5.6
docker rmi openweb/php:7.0
docker rmi openweb/php:7.1
docker rmi openweb/php:7.2
docker rmi openweb/php:7.3
docker rmi openweb/php:7.4

docker stop db
docker rm db

docker stop redis
docker rm redis

pause
