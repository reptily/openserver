cd ../

Set FILE=.env

For /F "PHP_VERSION=* delims=" %%i In ("%FILE%") Do Set PHP_VERSION=%%i
For /F "NODE_VERSION=* delims=" %%i In ("%FILE%") Do Set NODE_VERSION=%%i

docker stop webserver
docker rm webserver

docker stop php
docker rm php
docker rmi openweb/php:%PHP_VERSION%

docker stop node
docker rm node:%NODE_VERSION%

docker stop mysql
docker rm mysql

docker stop pgsql
docker rm pgsql

docker stop redis
docker rm redis

docker stop rabbitmq
docker rm rabbitmq

pause
