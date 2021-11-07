#!/bin/sh

if [ "$#" -ne 1 ] || expr "$1" : ".*[^0-9].*" >/dev/null; then
  echo "Usage: leap.sh <year>"
  exit 1
fi

year="$1"
[ $(( year % 4 )) -ne 0 ] && echo 'false' && exit
[ $(( year % 100 )) -ne 0 ] && echo 'true' && exit
# Year is divisible by 4 and 100 so need to check 400 now
[ $(( year % 400 )) -eq 0 ] && echo 'true' || echo 'false'

