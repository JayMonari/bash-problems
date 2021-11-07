#!/bin/sh -x

while getopts ':w:b:' arg; do
    case "$arg" in
        w)
            white_row=$(echo "$OPTARG" | cut -d, -f1)
            white_col=$(echo "$OPTARG" | cut -d, -f2)
            ;;
        b)
            black_row=$(echo "$OPTARG" | cut -d, -f1)
            black_col=$(echo "$OPTARG" | cut -d, -f2)
            ;;
        :)
            echo "$0: Must supply an argument to -$OPTARG." >&2
            exit 1
            ;;
        ?)
            echo "Invalid option: -${OPTARG}."
            exit 2
            ;;
    esac
done

# Check if the two queens are on the board
if [ "$white_row" -lt 0 ] || [ "$black_row" -lt 0 ]; then
    echo 'row not positive' && exit 1
elif [ "$white_col" -lt 0 ] || [ "$black_col" -lt 0 ]; then
    echo 'column not positive' && exit 1
elif [ "$white_row" -gt 7 ] || [ "$black_row" -gt 7 ]; then
    echo 'row not on board' && exit 1
elif [ "$white_col" -gt 7 ] || [ "$black_col" -gt 7 ]; then
    echo 'column not on board' && exit 1
fi

# Same position...
if [ "$white_row" -eq "$black_row" ] && [ "$black_col" -eq "$white_col" ]; then
    echo 'same position' && exit 1
fi

# Check if they are in range to attack each other
if [ "$black_row" -eq "$white_row" ] || [ "$black_col" -eq "$white_col" ] ||
    [ "$(( black_row - black_col ))" -eq "$(( white_row - white_col ))" ] ||
    [ "$(( black_row + black_col ))" -eq "$(( white_row + white_col ))" ]
then
    echo 'true'
else
    echo 'false'
fi

