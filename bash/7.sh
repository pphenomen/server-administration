#!/bin/bash

IFS=':' read -r -a path_dirs <<< "$PATH"

for dir in "${path_dirs[@]}"; do
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        file_count=$(find "$dir" -maxdepth 1 -type f -not -type l 2>/dev/null | wc -l)
        echo "$dir => $file_count"
    else
	exit 1
    fi
done
