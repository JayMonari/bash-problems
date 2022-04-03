#!/bin/sh
target=$1
if [ "$target" = 'A' ]; then
  echo 'A' && exit
fi

fmt_tip() {
  printf " %$(( padding / 2 ))s%$(( padding / 2 ))s\n" 'A' ' '
}
fmt_row() {
  printf "%${1}s %${2}s%-${3}s\n" "$4" "$4" ''
}
ascii_val=$(printf '%d' \'"$target")
padding=$(( (ascii_val - 65) * 2 + 1 ))
leftpad=$(( padding / 2 ))
midpad=1

fmt_tip

revfd=$(mktemp)
for ltr in B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
  rightpad=$(( leftpad - 1 ))

  if [ "$rightpad" -eq 0 ]; then
    fmt_row "$leftpad" "$midpad" "$rightpad" "$ltr"
    break
  fi
  fmt_row "$leftpad" "$midpad" "$rightpad" "$ltr" | tee -a "$revfd"

  leftpad=$(( leftpad - 1 ))
  midpad=$(( midpad + 2 ))
done
tac "$revfd"

fmt_tip
