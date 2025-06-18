#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <имя_файла> <время_работы_в_секундах>"
    exit 1
fi

OUTPUT_FILE="$1"    
DURATION="$2"       

if ! [[ "$DURATION" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: Время работы должно быть числом."
    exit 1
fi

echo "Сохранение нагрузки в файл $OUTPUT_FILE в течение $DURATION секунд..."

START_TIME=$(date +%s)  
while [ $(($(date +%s) - START_TIME)) -lt "$DURATION" ]; do

    TIMESTAMP=$(date "+[%d.%m.%y] %H:%M")

    LOAD_AVG=$(awk '{print $1, $2, $3}' /proc/loadavg)

    echo "$TIMESTAMP = $LOAD_AVG" >> "$OUTPUT_FILE"

    sleep 1
done

echo "Сбор данных завершён."
