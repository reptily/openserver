@echo off

set CONTAINER=

if "%~1"=="" (
    cd ..
    echo Select number container:
    echo 1, 2, 3 ...

    set NUMBER_CONTAINER=1
    for /f "skip=2 tokens=1" %%i in ('docker-compose ps') do (
        echo !NUMBER_CONTAINER!) %%i
        set CONTAINER_NAME[!NUMBER_CONTAINER!]=%%i
        set /a NUMBER_CONTAINER+=1
    )

    set /p SELECT_NUMBER_CONTAINER=Select a container number:

    set CONTAINER=!CONTAINER_NAME[%SELECT_NUMBER_CONTAINER%]!
) else (
    set CONTAINER=%~1
)

docker exec -it %CONTAINER% /bin/bash
