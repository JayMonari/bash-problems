#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
fi

strand1="$1"
strand2="$2"
if [ ${#strand1} -ne ${#strand2} ]; then
  echo "strands must be of equal length"
  exit 1
fi

distance=0
length=${#strand1}
for i in $(seq 1 1 "$length"); do
  nuc1=$(echo "$strand1" | cut -c"$i")
  nuc2=$(echo "$strand2" | cut -c"$i")
  [ "$nuc1" != "$nuc2" ] && distance=$(( distance+1 ))
done

echo "$distance"

