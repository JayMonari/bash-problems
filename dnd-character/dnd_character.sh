#!/usr/bin/env bash

modifier() {
    num=
    if [ "$1" -lt 10 ] && [ "$(( $1 % 2 ))" -eq 1 ]; then
        num=$(( "$1" - 1 ))
    else
        num=$1
    fi
    echo "scale=0;($num - 10) / 2" | bc -l
}

generate() {
    echo "strength $(( 1 + RANDOM  % 18 ))"
    echo "dexterity $(( 1 + RANDOM  % 18 ))"
    echo "constitution $(( 1 + RANDOM  % 18 ))"
    echo "intelligence $(( 1 + RANDOM  % 18 ))"
    echo "wisdom $(( 1 + RANDOM  % 18 ))"
    echo "charisma $(( 1 + RANDOM  % 18 ))"
    echo "hitpoints $(( 1 + RANDOM  % 18 ))"
}

func=$1
if [ "$func" = 'modifier' ]; then
    modifier "$2"
else
    generate
fi

