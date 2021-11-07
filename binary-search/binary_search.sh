#!/usr/bin/env bash

target="$1"
shift
IFS=\  read -ra nums <<< "$@"
lo=0
hi=${#nums[@]}

while (( lo <= hi )); do
  mid=$(( lo + (hi-lo)/2 ))
  cand=${nums[mid]}
  if (( cand < target )); then
    (( lo = mid + 1 ))
  elif (( cand > target )); then
    (( hi = mid - 1 ))
  else
    echo "$mid" && exit
  fi
done

echo -1
