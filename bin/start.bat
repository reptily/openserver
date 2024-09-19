@echo off
cd ..

if not exist ".env" (
    copy "env-example" ".env"
)

if not exist "docker-compose.yml" (
    copy "docker-compose-example.yml" "docker-compose.yml"
)

docker-compose up -d
cd ./bin
pause
