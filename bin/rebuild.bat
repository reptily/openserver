cd ../

Set FILE=.env

For /F "PHP_VERSION=* delims=" %%i In ("%FILE%") Do Set PHP_VERSION=%%i
For /F "NODE_VERSION=* delims=" %%i In ("%FILE%") Do Set NODE_VERSION=%%i

docker stop os-nginx
docker rm os-nginx

docker stop os-php%PHP_VERSION%
docker rm os-php%PHP_VERSION%
docker rmi openweb/php:%PHP_VERSION%

docker stop os-node%NODE_VERSION%
docker rm os-node%NODE_VERSION%

docker stop os-mysql5.7.24
docker rm os-mysql5.7.24

docker stop os-pgsql
docker rm os-pgsql

docker stop os-redis
docker rm os-redis

docker stop os-rabbitmq
docker rm os-rabbitmq

docker stop os-memcached
docker rm os-memcached

pause
