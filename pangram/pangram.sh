#!/bin/sh

lower='a b c d e f g h i j k l m n o p q r s t u v w x y z'
sentence=$(echo "$1" | tr '[:upper:]' '[:lower:]')
counter=0
for letter in $lower; do
  expr "$sentence" : ".*\($letter\).*" >/dev/null && counter=$(( counter+1 ))
done

[ "$counter" -eq 26 ] && echo 'true' || echo 'false'

