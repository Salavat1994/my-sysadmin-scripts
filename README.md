# my-sysadmin-scripts



Учебный capstone-проект по системному администрированию.



## Что делает проект



Скрипт каждые 10 секунд собирает:

- состояние памяти;

- состояние файловых систем;

- uptime.



Результат сохраняется в `monitor.log`.



## Архитектура



```text

Client

  -> HTTPS

  -> Nginx

  -> localhost:8080

  -> Docker container

  -> Python HTTP server

  -> monitor.log
