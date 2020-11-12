if not exist %1 echo "Не задан аргумент"

docker exec -it %1 /bin/bash
pause
