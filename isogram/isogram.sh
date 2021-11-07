#!/bin/sh

word=$(echo "$1" | tr -d '[:space:]-' | tr '[:upper:]' '[:lower:]')
cleaned=$(echo "$word" | grep -o . | sort -u | tr -d '[:space:]')

[ ${#word} -eq ${#cleaned} ] && echo 'true' || echo 'false'

