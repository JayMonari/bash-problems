#!/bin/sh

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "1 or 2 arguments expected"
    exit 1
fi

start="$1"
[ -z "$2" ] && end="$1" || end="$2"
if [ "$start" -lt "$end" ]; then
    echo "Start must be greater than End"
    exit 1
fi

for i in $(seq "$start" -1 "$end"); do
    if [ "$i" -gt 2 ]; then
        printf "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n\n" "$i" "$i" $(( i-1 ))
    elif [ "$i" -eq 2 ]; then
        printf "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n" "$i" "$i"
    elif [ "$i" -eq 1 ]; then
        printf "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\n"
    else
        printf "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n\n"
    fi
done

