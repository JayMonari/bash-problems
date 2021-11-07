#!/bin/sh

convert_color() {
    case "$1" in
        black)  echo 0 ;;
        brown)  echo 1 ;;
        red)    echo 2 ;;
        orange) echo 3 ;;
        yellow) echo 4 ;;
        green)  echo 5 ;;
        blue)   echo 6 ;;
        violet) echo 7 ;;
        grey)   echo 8 ;;
        white)  echo 9 ;;
        *) exit 1 ;;
    esac
}

color1=$(convert_color "$1")
[ "$?" -eq 1 ] && echo "invalid color" && exit 1
color2=$(convert_color "$2")
[ "$?" -eq 1 ] && echo "invalid color" && exit 1
echo "${color1}${color2}"

