#!/usr/bin/env bash

(( $# == 6 )) || exit 1

declare -a counter inverse_cnt
declare -i sum

setup() {
  for die_val; do (( counter[die_val]++ )); (( sum += die_val )); done
  for c in "${!counter[@]}"; do (( inverse_cnt[counter[c]]=c )); done
}

category="$1"; shift
setup "$@"
score=0
case "$category" in
  ones)   for die_val; do (( die_val == 1 && (score += die_val) )); done ;;
  twos)   for die_val; do (( die_val == 2 && (score += die_val) )); done ;;
  threes) for die_val; do (( die_val == 3 && (score += die_val) )); done ;;
  fours)  for die_val; do (( die_val == 4 && (score += die_val) )); done ;;
  fives)  for die_val; do (( die_val == 5 && (score += die_val) )); done ;;
  sixes)  for die_val; do (( die_val == 6 && (score += die_val) )); done ;;
  choice) (( score=sum )) ;;
  'full house') [[ "${!inverse_cnt[*]}" = "2 3" ]] && (( score=sum )) ;;
  'little straight') [[ "${!counter[*]}" = "1 2 3 4 5" ]] && (( score=30 )) ;;
  'big straight')    [[ "${!counter[*]}" = "2 3 4 5 6" ]] && (( score=30 )) ;;
  'four of a kind')
    [[ "${!inverse_cnt[*]}" = "1 4" ]] && (( score= 4 * inverse_cnt[4] ))
    [[ "${!inverse_cnt[*]}" = "5" ]] && (( score= 4 * inverse_cnt[5] ))
    ;;
  yacht)
    first="$1"
    for die_val; do
      if [[ $first != "$die_val" ]]; then
        echo 0 && exit
      fi
    done
    (( score=50 ))
esac

echo "$score"
