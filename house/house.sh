#!/usr/bin/env bash

start="$1"
end="$2"
if [ "$start" -gt "$end" ] || [ "$start" -lt 1 ] || [ "$end" -gt 12 ]; then
  printf "invalid start: %d or end: %d" "$start" "$end"
  exit 1
fi

actors=(
  "the house that Jack built."
  "the malt"
  "the rat"
  "the cat"
  "the dog"
  "the cow with the crumpled horn"
  "the maiden all forlorn"
  "the man all tattered and torn"
  "the priest all shaven and shorn"
  "the rooster that crowed in the morn"
  "the farmer sowing his corn"
  "the horse and the hound and the horn"
)

actions=(
  "lay in"
  "ate"
  "killed"
  "worried"
  "tossed"
  "milked"
  "kissed"
  "married"
  "woke"
  "kept"
  "belonged to"
)

make_verse() {
  b="$1"
  echo "This is ${actors[b]}"
  for j in $(seq $(( b-1 )) -1 0); do
    echo "that ${actions[j]} ${actors[j]}"
  done
  echo
}

for i in $(seq "$start" 1 "$end"); do
  make_verse $(( i-1 ))
done

