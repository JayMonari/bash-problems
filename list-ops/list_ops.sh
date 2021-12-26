#!/usr/bin/env bash

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    echo "This library of functions should be sourced into another script" >&2
    exit 4
fi
bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This library requires at least bash version 4.3" >&2
    return 4
fi

# Due to inherent bash limitations around word splitting and globbing,
# functions that are intended to *return a list* are instead required to
# receive a nameref parameter, the name of an array variable that will be
# populated in the list function.
# See the filter, map and reverse functions.

# Also note that nameref parameters cannot have the same name as the
# name of the variable in the calling scope.


# Append some elements to the given list.
list::append () {
  declare -n lst=$1
  lst+=("${@:2}")
}

# Return only the list elements that pass the given function.
list::filter () {
  declare -n lst=$2 res=$3
  for value in "${lst[@]}"; do
    $1 "$value" && res+=("$value")
  done
}

# Transform the list elements, using the given function,
# into a new list.
list::map () {
  declare -n lst=$2 res=$3
  for value in "${lst[@]}"; do
    res+=("$($1 "$value")")
  done
}

# Left-fold the list using the function and the initial value.
list::foldl () {
  declare -n lst=$3
  local total="$2"
  for value in "${lst[@]}"; do
    total=$($1 "$total" "$value")
  done
  echo "$total"
}

# Right-fold the list using the function and the initial value.
list::foldr () {
  declare -n lst=$3
  local total="$2"
  for i in "${!lst[@]}"; do
    total="$($1 "${lst[-$i - 1]}" "$total")"
  done
  echo "$total"
}

# Return the list reversed
list::reverse () {
  declare -n lst=$1 res=$2
  for i in "${!lst[@]}"; do
    res+=("${lst[-$i - 1]}")
  done
}
