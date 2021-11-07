#!/bin/sh

is_digit() {
  expr "$1" : "^[-.0-9]\+$" >/dev/null && return 0 || return 1
}

if [ $# -ne 2 ] || ! is_digit "$1" || ! is_digit "$2"; then
  echo "Usage: 1 and 2" && exit 1;
fi

echo "
define earned (point) {
  if (point <= 1) {
    return 10
  } else if (point <= 25) {
    return 5
  } else if (point <= 100) {
    return 1
  } else {
    return 0
  }
}

earned($1*$1 + $2*$2)
" | bc -l

