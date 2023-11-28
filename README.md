<p align="center">
    <img src="https://sun9-11.userapi.com/RDoybNFs7mey2inq3razd81BsdSVaI547fVaOA/RF_7mZk-V7E.jpg">
</p>

# Поддержка
PHP версии: 8.3, 8.2, 8.1, 8.0, 7.4, 7.3, 7.2, 7.1, 7.0, 5.6, 5.4

# Установка
* Клонируем или скачиваем последний релиз
* Копируем файл *env-example* в *.env*, при необходимости меняем настройки

## Linux

Все действия выполняются в директории *bin*

Чтобы запустить графический помощник (требуется установленный пакет dialog)
```bash
./app
```
<p align="center">
    <img src="https://sun9-79.userapi.com/impg/8uScuaHdpEQB5HVFyoF5yJZdIQl1WBdsMT1VZg/pSw8HXu0j54.jpg?size=542x302&quality=95&sign=913f84780b2068d8933574a26b2b1f0d&type=album">
</p>

Собрать выборочную сборку
```bash
./build
```

Запуск
```bash
./start
```

Остановка
```bash
./stop
```

Зайти в контейнер (аргумент имя контейнера)
```bash
./exec app
```
Если запустить без аргумента, открывается список доступных контейнеров, и по выброному номеру можно будет ощуществить вход.
```bash
./exec
```
```bash
Select number container: 1, 2, 3 ...
1) ow_php
2) ow_mysql
```


Пересобрать контейнеры
```bash
./rebuild
```

Создать новый локальный хост
```bash
./create_host
```

## Windows

Все действия выполняются в директории *bin*\

Запуск
* start.bat

Остановка
* stop.bat

Зайти в контейнер
* exec.bat

Пересобрать контейнеры
* rebuild.bat

# XDebugger
IDE key: openweb

# Импорт дополнительных скриптов в контейнеры
Все файлы которые будут располагаться в директории *scripts* попадут в контейнер директорию */bin/app*

## Системные требования
Свободного места - 2 GB\
Docker\
Docker compose

## Создание виртуального хоста
Все действия выполняются в директории *bin*

Запуск для Linux
```bash
./create_host
```
Далее вводим имя хоста, зачем перезапускаем докер или отдельно контейнер с nginx

### Полезные ссылки
<a href="https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe">Скачать Docker (windows)</a>

<a href="https://reptily.ru/donate">Поддержка проекта</a>

### Программное обеспечение
PHP\
Python\
NODE.js\
MySQL\
PosgresSQL\
Memcached\
Redis\
Xdebug\
MongoDB \
ClickHouse
