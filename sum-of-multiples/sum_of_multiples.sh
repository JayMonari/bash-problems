#!/usr/bin/env bash

limit="$1"
shift

multiples=()
for num; do
  for fac in $(seq "$num" "$num" $(( limit-1 )) 2>/dev/null); do
    multiples[$fac]=true
  done
done

sum=0
for num in "${!multiples[@]}"; do
  sum=$(( sum + num ))
done

echo "$sum"

