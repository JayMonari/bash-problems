#!/bin/sh

id_num=$(echo "$1" | tr -d ' ')
len=${#id_num}
[ "$len" -eq 1 ] && echo 'false' && exit
# Check for values other than digits
expr "$id_num" : "[0-9]\+" != "$len" >/dev/null && echo 'false' && exit

sum=0
is_second='false'
for idx in $(seq "$len" -1 1); do
  digit=$(echo "$id_num" | cut -c"$idx")

  if [ "$is_second" = 'true' ]; then
    digit=$(( digit * 2 ))
    [ "$digit" -lt 10 ] || digit=$(( digit - 9 ))
    is_second='false'
  else
    is_second='true'
  fi

  sum=$(( sum + digit ))
done

[ "$(( sum % 10 ))" -eq 0 ] && echo 'true' || echo 'false'

