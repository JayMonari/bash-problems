#!/bin/sh

planet="$1"
seconds="$2"

case "$planet" in
    Earth)   period="1"          ;;
    Mercury) period="0.2408467"  ;;
    Venus)   period="0.61519726" ;;
    Mars)    period="1.8808158"  ;;
    Jupiter) period="11.862615"  ;;
    Saturn)  period="29.447498"  ;;
    Uranus)  period="84.016846"  ;;
    Neptune) period="164.79132"  ;;
    *) echo 'not a planet' && exit 1 ;;
esac

printf '%.2f\n' $(echo "$2 / 60 / 60 / 24 / $period / 365.25" | bc -l)

