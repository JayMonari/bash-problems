#!/usr/bin/env bash

[ "$1" = '' ] || [ "$1" -lt 2 ] && echo '' && exit

limit="$1"
mapfile -t factors <<<  $(seq 0 1 "$limit")
primes=()
for i in $(seq 2 1 "$limit"); do
    is_prime_factor="${factors[i]}"
    if [ "$is_prime_factor" -ne "$i" ]; then
        continue
    fi
    primes+=("$i")
    for factor in $(seq "$i" "$i" "$limit"); do
        factors[factor]=0
    done
done

echo "${primes[@]}"

