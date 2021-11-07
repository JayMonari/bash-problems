#!/bin/sh

square_of_sum() {
  sum=$(seq 1 1 "$1" | xargs | tr ' ' '+' | bc -l)
  echo "$sum^2" | bc -l
}

sum_of_squares() {
  seq -f '%g^2' 1 1 "$1" | xargs | tr ' ' '+' | bc -l
}

difference() {
  echo $(( $(square_of_sum "$1") - $(sum_of_squares "$1") ))
}

"$1" "$2"

