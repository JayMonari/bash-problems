#!/bin/sh

cleaned_number=$(echo "$1" | tr -cd '[:digit:]')
if [ ${#cleaned_number} -eq 11 ]; then
  country_code=$(echo "$cleaned_number" | cut -c1)
  if [ "$country_code" -ne 1 ]; then
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
  fi
  cleaned_number=$(echo "$cleaned_number" | cut -c2-)
fi

area_code_start=$(echo "$cleaned_number" | cut -c1)
exchange_code_start=$(echo "$cleaned_number" | cut -c4)
if [ ${#cleaned_number} != 10 ] ||
  [ "$area_code_start" -lt 2 ] ||
  [ "$exchange_code_start" -lt 2 ]
then
  echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
  exit 1
fi

echo "$cleaned_number"

