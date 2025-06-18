#!/bin/bash

log_dir="/var/log"

output_file="logs.log"

> "$output_file"

for log_file in "$log_dir"/*.log; do
    if [ -f "$log_file" ]; then
        last_line=$(tail -n 1 "$log_file")
        echo "$last_line" >> "$output_file"
    fi
done

echo "Results saved to: $output_file"
