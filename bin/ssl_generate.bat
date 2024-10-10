@echo off

for /f "tokens=2 delims==" %%a in ('findstr PREFIX ..\.env') do set PREFIX=%%a

docker stop %PREFIX%webserver

cd ..\image\ssl-generate
docker-compose up -d
cd ..\..\bin

set /p DOMAIN="Input domain: "

for /f "tokens=1-3 delims= " %%a in ('echo %date% %time%') do set DATE=%%a_%%b.%%c

set SSL_DIR=%cd%\..\config\nginx\ssl\
set WWW_DIR=%cd%\..\image\ssl-generate\www\
set NGINX_CONFIG=%cd%\..\config\nginx\sites\
set LOGS_DIR=%cd%\..\logs\
mkdir "%SSL_DIR%" 2>nul

if exist "%SSL_DIR%%DOMAIN%" (
    move "%SSL_DIR%%DOMAIN%" "%SSL_DIR%%DOMAIN%-%DATE%"
)

docker run -it --rm --name certbot ^
-v "%SSL_DIR%:/etc/letsencrypt/archive" ^
-v "%WWW_DIR%:/var/www" ^
-v "%LOGS_DIR%:/var/log" ^
certbot/certbot certonly --webroot -w /var/www -d %DOMAIN% ^
--config-dir /etc/letsencrypt ^
--logs-dir /var/log/letsencrypt

powershell -Command "(Get-Content '%NGINX_CONFIG%..\\template.ssl.conf-example') -replace '{{host_name}}', '%DOMAIN%' | Set-Content '%NGINX_CONFIG%%DOMAIN%.ssl.conf'"

cd ..\image\ssl-generate
docker-compose down
cd ..\..\bin

docker start %PREFIX%webserver
pause
