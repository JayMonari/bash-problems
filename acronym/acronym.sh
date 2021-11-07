#!/bin/sh

sanitized=$(echo "$1" | tr -c "[:alpha:]\'" ' ' | tr '[:lower:]' '[:upper:]')
acronym=
for word in $sanitized; do
  acronym="${acronym}$(echo "$word" | cut -c1)"
done

echo "$acronym"

