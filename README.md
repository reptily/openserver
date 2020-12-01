<p align="center">
    <img src="https://sun9-11.userapi.com/RDoybNFs7mey2inq3razd81BsdSVaI547fVaOA/RF_7mZk-V7E.jpg">
</p>

# Поддержка
PHP версии: 8.0 7.4, 7.3, 7.2, 7.1, 7.0, 5.6, 5.4

# Установка
* Клонируем или скачиваем последний релиз
* Копируем файл *env-example* в *.env*, при необходимости меняем настройки

## Linux

Все действия выполняются в директории *bin*

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

Пересобрать контейнеры
```bash
./rebuild
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

### Полезные ссылки
<a href="https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe">Скачать Docker (windows)</a>

### Программное обеспечение
PHP\
NODE.js\
MySQL\
PosgresSQL\
Memcached\
Redis\
Xdebug
