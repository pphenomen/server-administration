#!/bin/bash

if [[ "$FOO" == "5" && "$BAR" == "1" ]]; then
    echo "Execution enterrupted: FOO=5 and BAR=1."
    exit 1
fi

initial_files=$(ls)

sleep 1
while true; do
    current_files=$(ls)

    new_file=$(comm -13 <(echo "$initial_files" | sort) <(echo "$current_files" | sort))

    if [[ -n "$new_file" ]]; then
        echo "New file: $new_file"
        break
    fi

    sleep 0.1
done
