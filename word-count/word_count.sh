#!/usr/bin/env bash
shopt -s assoc_expand_once

declare -A freq
declare -l word

for sentence in "$@"; do
  sentence="${sentence@E}"
  # Close as we get to global regex matching
  while [[ $sentence =~ [[:alnum:]"'"]+ ]]; do
    word=${BASH_REMATCH[0]}
    sentence=${sentence#*${BASH_REMATCH[0]}}
    if [[ $word =~ ^\' ]]; then
      # Remove ^' and '$
      word=${word:1:$(( ${#word} - 2 ))}
    fi
    (( freq[$word] += 1 ))
  done
done

for word in "${!freq[@]}"; do
  echo "$word: ${freq[$word]}"
done
