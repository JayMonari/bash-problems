#!/usr/bin/env -S bash -x
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
      word=${word:1:${#word}}
    fi
    if [[ $word =~ \'$ ]]; then
      word=${word:0:$(( ${#word} - 1 ))}
    fi
    if [ $word ]; then
      (( freq[$word] += 1 ))
    fi
  done
done

for word in "${!freq[@]}"; do
  echo "$word: ${freq[$word]}"
done
