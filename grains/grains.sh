#!/bin/sh

[ "$1" = 'total' ] && echo '2^64 - 1' | bc && exit

if [ "$1" -lt 1 ] || [ "$1" -gt 64 ]; then
  echo "Error: invalid input"
  exit 1
fi

echo "2^($1 - 1)" | bc

