#!/usr/bin/env bash

words=( "$@" )
length=$(( $# - 1 ))
for i in $(seq 0 1 "$length"); do
    [ "$i" -eq "$length" ] && echo "And all for the want of a $1." && exit
    echo "For want of a ${words[i]} the ${words[i+1]} was lost."
done

#For want of a nail the shoe was lost.
#For want of a shoe the horse was lost.
#For want of a horse the rider was lost.
#For want of a rider the message was lost.
#For want of a message the battle was lost.
#For want of a battle the kingdom was lost.
#And all for the want of a nail.
