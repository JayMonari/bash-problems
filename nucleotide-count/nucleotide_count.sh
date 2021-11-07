#!/bin/sh

if expr "$1" : "[ACGT]*" != "${#1}" >/dev/null; then
  echo >&2 "Invalid nucleotide in strand"
  exit 1
fi

echo "A: $(printf '%s' "$1" | tr -d 'GCT[:blank:]' | wc -c)"
echo "C: $(printf '%s' "$1" | tr -d 'GAT[:blank:]' | wc -c)"
echo "G: $(printf '%s' "$1" | tr -d 'ACT[:blank:]' | wc -c)"
echo "T: $(printf '%s' "$1" | tr -d 'GCA[:blank:]' | wc -c)"

