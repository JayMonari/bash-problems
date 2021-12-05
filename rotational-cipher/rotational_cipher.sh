#!/bin/sh

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf %d "'$1"
}

rotate() {
  cp="$1"
  shift="$2"
  start="$3"
  fin="$4"

  newchr=$(( cp + shift ))
  if [ "$newchr" -lt "$start" ]; then
    echo $(( newchr + fin - start + 1 ))
  elif [ "$newchr" -gt "$fin" ]; then
    echo $(( newchr%fin + start - 1 ))
  else
    echo "$newchr"
  fi
}

text="$1"
key="$2"
for i in $(seq 1 1 ${#text}); do
  c=$(printf '%s' "$text" | cut -c"$i")
  cp=$(ord "$c")
  if [ "$cp" -ge 97 ] && [ "$cp" -le 122 ]; then
    printf '%s' "$(chr "$(rotate "$cp" "$key" 97 122)")"
  elif [ "$cp" -ge 65 ] && [ "$cp" -le 90 ]; then
    printf '%s' "$(chr "$(rotate "$cp" "$key" 65 90)")"
  else
    printf '%s' "$c"
  fi
done

