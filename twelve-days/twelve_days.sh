#!/usr/bin/env -S bash

presents=(
    "a Partridge in a Pear Tree."
    "two Turtle Doves,"
    "three French Hens,"
    "four Calling Birds,"
    "five Gold Rings,"
    "six Geese-a-Laying,"
    "seven Swans-a-Swimming,"
    "eight Maids-a-Milking,"
    "nine Ladies Dancing,"
    "ten Lords-a-Leaping,"
    "eleven Pipers Piping,"
    "twelve Drummers Drumming,"
)

verse() {
    day="$1"
    lyric="On the"
    case "$day" in
        1) lyric="$lyric first" ;;
        2) lyric="$lyric second" ;;
        3) lyric="$lyric third" ;;
        4) lyric="$lyric fourth" ;;
        5) lyric="$lyric fifth" ;;
        6) lyric="$lyric sixth" ;;
        7) lyric="$lyric seventh" ;;
        8) lyric="$lyric eighth" ;;
        9) lyric="$lyric ninth" ;;
        10) lyric="$lyric tenth" ;;
        11) lyric="$lyric eleventh" ;;
        12) lyric="$lyric twelfth" ;;
        *) exit 1 ;;
    esac

    lyric="$lyric day of Christmas my true love gave to me:"
    [ "$day" -eq 1 ] && echo "$lyric ${presents[0]}" && return

    for i in $(seq $(( day - 1 )) -1 0); do
        [ "$i" -eq 0 ] && lyric="$lyric and ${presents[i]}" && break
        lyric="$lyric ${presents[i]}"
    done

    echo "$lyric"
}

for line in $(seq "$1" 1 "$2"); do
    verse "$line"
done

