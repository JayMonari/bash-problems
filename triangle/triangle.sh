#!/bin/sh

if [ "$#" -ne 4 ]; then
  echo >&2 "Usage: triangle.sh <tri_type> <side1> <side2> <side3>"
  exit 1
fi

s1="$2"
s2="$3"
s3="$4"
violation=$(echo "$s1+$s2 < $s3 || $s1+$s3 < $s2 || $s2+$s3 < $s1" | bc -l)
has_zero_side=$(echo "$s1 == 0 || $s2 == 0 || $s3 == 0" | bc -l)
[ "$violation" -ne 0 ] || [ "$has_zero_side" -ne 0 ] && echo 'false' && exit

type="$1"
is_equilateral=$(echo "$s1 == $s2 && $s1 == $s3" | bc -l)
is_isosceles=$(echo "$s1 == $s2 || $s1 == $s3 || $s2 == $s3" | bc -l)
if [ "$is_equilateral" -ne 0 ]; then
  [ "$type" = 'equilateral' ] || [ "$type" = 'isosceles' ] && echo 'true' ||
    echo 'false'
elif [ "$is_isosceles" -ne 0 ]; then
  [ "$type" = 'isosceles' ] && echo 'true' || echo 'false'
else
  [ "$type" = 'scalene' ] && echo 'true' || echo 'false'
fi

