@echo off

set /p DOMAIN="Input domain: "
set /p PATH_INDEX="Input the path to the directory where the index file (example /):"

set "SSL_DIR=%cd%/../config/nginx/ssl"
set "WWW_DIR=%cd%/../www"
set "NGINX_CONFIG=../config/nginx/sites/"
mkdir "%SSL_DIR%" -p

docker run -it --rm --name certbot ^
-v "%SSL_DIR%:/etc/letsencrypt/archive" ^
-v "%WWW_DIR%/%DOMAIN%/%PATH_INDEX%:/var/www" ^
certbot/certbot certonly --webroot -w /var/www -d %DOMAIN% ^
--config-dir /etc/letsencrypt ^
--logs-dir /var/log/letsencrypt

type "%NGINX_CONFIG%../template.ssl.conf-example" | powershell -Command "& {$_ -replace '{{host_name}}', '%DOMAIN%'}" > "%NGINX_CONFIG%%DOMAIN%.ssl.conf"
