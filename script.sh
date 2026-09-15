#!/usr/bin/env bash



set -u



readonly INTERVAL_SECONDS=10

readonly LOG_FILE="monitor.log"



if ! [[ "$INTERVAL_SECONDS" =~ ^[1-9][0-9]*$ ]]; then

    echo "Ошибка: INTERVAL_SECONDS должен быть положительным целым числом." >&2

    exit 1

fi



for command_name in free df uptime date sleep; do

    if ! command -v "$command_name" >/dev/null 2>&1; then

        echo "Ошибка: команда '$command_name' не найдена." >&2

        exit 1

    fi

done



if ! touch "$LOG_FILE" 2>/dev/null; then

    echo "Ошибка: невозможно записывать данные в '$LOG_FILE'." >&2

    exit 1

fi



echo "Мониторинг запущен."

echo "Интервал: ${INTERVAL_SECONDS} секунд."

echo "Файл журнала: ${LOG_FILE}"



while true; do

    {

        printf -- '--- %s ---\n' "$(date '+%Y-%m-%d %H:%M:%S')"

        free -h

        df -h

        uptime

        printf '\n'

    } >> "$LOG_FILE"



    sleep "$INTERVAL_SECONDS"

done
