if not exist %1 echo "Не задан аргумент"

cd ../
docker logs %1
cd ./bin
pause
