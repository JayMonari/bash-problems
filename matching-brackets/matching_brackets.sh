#!/usr/bin/env bash

line=$(echo "$1" | tr -dc '{}()[]')
open_pairs=()

for idx in $(seq 1 1 "${#line}"); do
    pair_part=$(echo "$line" | cut -c"$idx")

    # Check if the part is an opening part
    if expr + "$pair_part" : "[({\[]" >/dev/null; then
        open_pairs+=("$pair_part")
        continue
    fi

    last_idx=$(( ${#open_pairs[@]} - 1 ))
    [ "$last_idx" -lt 0 ] && echo 'false' && exit

    open_pair=${open_pairs["$last_idx"]}
    if [ "$pair_part" = ')' ]; then
        [ "$open_pair" != '(' ] && echo 'false' && exit
    elif [ "$pair_part" = ']' ]; then
        [ "$open_pair" != '[' ] && echo 'false' && exit
    elif [ "$pair_part" = '}' ]; then
        [ "$open_pair" != '{' ] && echo 'false' && exit
    fi

    unset open_pairs["$last_idx"]
done

[ "${#open_pairs[@]}" -eq 0 ] && echo 'true' || echo 'false'

