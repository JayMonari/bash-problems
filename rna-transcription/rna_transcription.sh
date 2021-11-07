#!/bin/sh

if expr "$1" : "[ACGT]*" != "${#1}" >/dev/null; then
  echo >&2 "Invalid nucleotide detected.";
  exit 1
fi
echo "$1" | tr 'ACGT' 'UGCA'

