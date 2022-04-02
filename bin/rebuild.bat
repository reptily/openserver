cd ../

Set FILE=.env

For /F "PREFIX=* delims=" %%i In ("%FILE%") Do Set PREFIX=%%i
For /F "PHP_VERSION=* delims=" %%i In ("%FILE%") Do Set PHP_VERSION=%%i
For /F "NODE_VERSION=* delims=" %%i In ("%FILE%") Do Set NODE_VERSION=%%i
For /F "MONGODB_VERSION=* delims=" %%i In ("%FILE%") Do Set MONGODB_VERSION=%%i

docker stop %PREFIX%webserver
docker rm %PREFIX%webserver

docker stop %PREFIX%php
docker rm %PREFIX%php
docker rmi openweb/php:%PHP_VERSION%

docker stop %PREFIX%node
docker rm %PREFIX%node:%NODE_VERSION%

docker stop %PREFIX%mysql
docker rm %PREFIX%mysql

docker stop %PREFIX%pgsql
docker rm %PREFIX%pgsql

docker stop %PREFIX%redis
docker rm %PREFIX%redis

docker stop %PREFIX%rabbitmq
docker rm %PREFIX%rabbitmq

docker stop %PREFIX%memcached
docker rm %PREFIX%memcached

docker stop %PREFIX%mongo
docker rm %PREFIX%mongo:%MONGODB_VERSION%

pause
