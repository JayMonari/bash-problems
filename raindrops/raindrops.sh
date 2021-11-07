#!/bin/sh

drop="$1"
sound=
[ $(( drop % 3 )) -eq 0 ] && sound="${sound}Pling"
[ $(( drop % 5 )) -eq 0 ] && sound="${sound}Plang"
[ $(( drop % 7 )) -eq 0 ] && sound="${sound}Plong"

[ -z "$sound" ] && echo "$drop" || echo "$sound"

