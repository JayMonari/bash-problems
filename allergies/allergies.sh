#!/usr/bin/env bash

score=$(( $1 % 256 ))

declare -rA item_scores=(
  [eggs]=1
  [peanuts]=2
  [shellfish]=4
  [strawberries]=8
  [tomatoes]=16
  [chocolate]=32
  [pollen]=64
  [cats]=128
)

declare -ra ordered_items=(
  eggs
  peanuts
  shellfish
  strawberries
  tomatoes
  chocolate
  pollen
  cats
)

allergic_to () {
  item="$1"
  [[ $(( score & item )) != 0 ]] && echo true || echo false
}

if [[ $2 == "allergic_to" ]]; then
  allergic_to "${item_scores[$3]}"
elif [[ $2 == "list" ]]; then
  declare -a allergies
  for item in "${ordered_items[@]}"; do
    if [[ $(allergic_to "${item_scores[$item]}") == 'true' ]]; then
      allergies+=("$item")
    fi
  done
  echo "${allergies[@]}"
fi

