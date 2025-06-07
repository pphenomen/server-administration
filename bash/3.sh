#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Ошибка: Не указаны файлы."
    exit 1
fi

total=0
found_any="false" # file not found

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "$file => not found"
        continue
    fi

    found_any="true"
    lines=$(wc -l < "$file") # count lines
    echo "$file => $lines"
    total=$((total + lines))
done
