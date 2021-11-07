#!/bin/sh

statement=$(echo "$1" | tr -d '[:space:]' | tr -c '[:alpha:]?:' '#')

is_yelling() {
  if expr "$1" : "^#*$" >/dev/null; then exit 1; fi

  orig=$(echo "$1" | tr -cd '[:alpha:]?')
  upper=$(echo "$orig" | tr '[:lower:]' '[:upper:]')
  [ "$orig" = "$upper" ] && [ "$orig" != '?' ] && echo 'true'
}

if [ -z "$statement" ]; then
  echo 'Fine. Be that way!'
elif $(is_yelling "$statement") &&
  expr "$statement" : ".*?$" >/dev/null
then
  echo "Calm down, I know what I'm doing!"
elif expr "$statement" : ".*?$" >/dev/null; then
  echo "Sure."
elif $(is_yelling "$statement"); then
  echo "Whoa, chill out!"
else
  echo "Whatever."
fi

