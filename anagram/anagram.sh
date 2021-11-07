#!/usr/bin/env bash

sorted() {
  tolower "$1" | grep -o . | sort | tr -d '\n\r'
}

tolower() {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}

original=$(tolower "$1")
target=$(sorted "$1")
shift

IFS=' ' read -ra words <<< "$@"
for word in "${words[@]}"; do
  lower=$(tolower "$word")
  if [ "$original" = "$lower" ]; then continue; fi
  if [ "$target" = "$(sorted "$word")" ]; then
    anagrams="${anagrams} $word"
  fi
done

printf '%s' "$anagrams" | cut -c2-

