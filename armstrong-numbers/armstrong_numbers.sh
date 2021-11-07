#!/bin/sh -x

power=${#1}
number="$1"

sum=0
for i in $(seq 1 1 ${#1}); do
  digit=$(echo "$number" | cut -c"$i")
  sum=$(( sum + digit**power ))
done

[ "$sum" -eq "$number" ] && echo 'true' || echo 'false'

