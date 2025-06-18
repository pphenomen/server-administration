#!/bin/bash

lc_vars=$(env | grep '^LC_')

if [ -z "$lc_vars" ]; then
    echo "Environment variables with 'LC_' are not found"
    exit 0
fi

first_value=$(echo "$lc_vars" | head -n 1 | cut -d= -f2)

while IFS= read -r line; do
    var_name=$(echo "$line" | cut -d= -f1)
    var_value=$(echo "$line" | cut -d= -f2)

    if [[ "$var_value" != "$first_value" ]]; then
        echo "Error: variable '$var_name' has value '$var_value', expected '$first_value'."
        exit 1
    fi
done <<< "$lc_vars"

echo "All environment variables with 'LC_:' has value '$first_value'."
