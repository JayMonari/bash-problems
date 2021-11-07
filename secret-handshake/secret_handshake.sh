#!/bin/sh

trim_string() {
    read -r str
    echo "$str" | rev | cut -c2- | rev
}

[ "$(( ($1 >> 0) & 1 ))" -eq 1 ] && events="${events}Xwink,"
[ "$(( ($1 >> 1) & 1 ))" -eq 1 ] && events="${events}Xdouble blink,"
[ "$(( ($1 >> 2) & 1 ))" -eq 1 ] && events="${events}Xclose your eyes,"
[ "$(( ($1 >> 3) & 1 ))" -eq 1 ] && events="${events}Xjump,"
[ "$(( ($1 >> 4) & 1 ))" -eq 0 ] &&
    echo "$events" | tr -d 'X' | trim_string && exit

echo "$events" | tr 'X ' '\nX' | tac | xargs | trim_string | tr -d ' ' | tr 'X' ' '

