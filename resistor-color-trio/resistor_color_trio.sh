#!/bin/sh

resistance=
for band in "$1" "$2" "$3"; do
    case "$band" in
        black)  resistance="${resistance}0" ;;
        brown)  resistance="${resistance}1" ;;
        red)    resistance="${resistance}2" ;;
        orange) resistance="${resistance}3" ;;
        yellow) resistance="${resistance}4" ;;
        green)  resistance="${resistance}5" ;;
        blue)   resistance="${resistance}6" ;;
        violet) resistance="${resistance}7" ;;
        grey)   resistance="${resistance}8" ;;
        white)  resistance="${resistance}9" ;;
        *) echo "invalid color" && exit 1 ;;
    esac
done

zeroes=$(echo "$resistance" | cut -c3)
resistance=$(echo "$resistance" | cut -c-2)
# Check for black
if [ "$(echo "$resistance" | cut -c2 )" -eq 0 ]; then
    zeroes=$(( zeroes + 1 ))
    resistance=$(echo "$resistance" | cut -c1)
fi

if [ "$zeroes" -lt 3 ]; then
    echo "$(echo "$resistance * 10^$zeroes" | bc) ohms"
elif [ "$zeroes" -lt 6 ]; then
    echo "$(echo "$resistance * 10^($zeroes - 3)" | bc) kiloohms"
elif [ "$zeroes" -lt 9 ]; then
    echo "$(echo "$resistance * 10^($zeroes - 6)" | bc) megaohms"
else
    echo "$(echo "$resistance * 10^($zeroes - 9)" | bc) gigaohms"
fi

