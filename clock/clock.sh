#!/bin/sh

if [ "$#" -lt 2 ] ||
    [ "$#" -gt 4 ] ||
    [ "$#" -eq 3 ] ||
    expr "$*" : "^.*[:alpha:].*$" != 0 >/dev/null ||
    [ "$3" = '/' ]
then
    echo "invalid arguments -- Usage: clock.sh hour mins [{+|-} delta]"
    exit 1
fi

hours="$1"
mins="$2"
operator="$3"
delta="$4"

if [ "$operator" = '+' ]; then
    mins=$(( mins + delta ))
elif [ "$operator" = '-' ]; then
    mins=$(( mins - delta ))
fi

hours=$(( hours + (mins / 60) ))
mins=$(( mins % 60 ))
if [ "$mins" -lt 0 ]; then
    hours=$(( hours-1 ))
    mins=$(( mins+60 ))
fi

hours=$(( hours % 24 ))
[ "$hours" -lt 0 ] && hours=$(( hours + 24 ))

printf '%.2d:%.2d' "$hours" "$mins"

