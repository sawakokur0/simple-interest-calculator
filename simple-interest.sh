#!/usr/bin/env bash

read -r -p 'Principal amount: ' principal || exit 1
read -r -p 'Annual interest rate (%): ' rate || exit 1
read -r -p 'Time in years: ' time || exit 1

number_pattern='^([0-9]+([.][0-9]+)?|[.][0-9]+)$'
if ! [[ $principal =~ $number_pattern && $rate =~ $number_pattern && $time =~ $number_pattern ]]; then
    printf 'Enter non-negative numbers for all three values.\n' >&2
    exit 1
fi

LC_ALL=C awk -v principal="$principal" -v rate="$rate" -v time="$time" \
    'BEGIN { printf "Simple interest: %.2f\n", principal * rate * time / 100 }'
