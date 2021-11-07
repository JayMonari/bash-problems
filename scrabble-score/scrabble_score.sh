#!/bin/sh

score=0
word=$(echo "$1" | tr '[:upper:]' '[:lower:]')
for i in $(seq 1 1 ${#word}); do
  letter=$(echo "$word" | cut -c"$i")
  case "$letter" in
    a | e | i | o | u | l | n | r | s | t) score=$(( score+1 ))   ;;
    d | g)                                 score=$(( score+2 ))   ;;
    b | c | m | p)                         score=$(( score+3 ))   ;;
    f | h | v | w | y)                     score=$(( score+4 ))   ;;
    k)                                     score=$(( score+5 ))   ;;
    j | x)                                 score=$(( score+8 ))   ;;
    q | z)                                 score=$(( score+10 ))  ;;
    *) echo "WHAT IS THAT??? -- $letter" ;;
  esac
done

echo "$score"

