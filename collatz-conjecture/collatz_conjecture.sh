#!/bin/sh

if [ "$1" -lt 1 ]; then
  echo >&2 "Error: Only positive numbers are allowed"
  exit 1
fi

count=0
int="$1"
while [ "$int" -ne 1 ]; do
  if [ $(( int % 2 )) -eq 0 ]; then
    int=$(( int / 2 ))
  else
    int=$(( int * 3 + 1 ))
  fi
  count=$(( count + 1 ))
done

echo "$count"

