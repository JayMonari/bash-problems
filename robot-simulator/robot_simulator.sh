#!/bin/sh

update_position() {
  x="$1"
  y="$2"
  dir="$3"
  instructions="$4"
  for i in $(seq 0 1 $(( ${#instructions} - 1 ))); do
    instr=$(echo "$instructions" | cut -c$(( i + 1 )))
    if [ "$instr" = 'R' ]; then
      case "$dir" in
        north) dir=east ;;
        east) dir=south ;;
        south) dir=west ;;
        west) dir=north ;;
      esac
    elif [ "$instr" = 'A' ]; then
      case "$dir" in
        east) x=$(( x + 1 )) ;;
        west) x=$(( x - 1 )) ;;
        north) y=$(( y + 1 )) ;;
        south) y=$(( y - 1 )) ;;
      esac
    elif [ "$instr" = 'L' ]; then
      case "$dir" in
        north) dir=west ;;
        east) dir=north ;;
        south) dir=east ;;
        west) dir=south ;;
      esac
    else
      echo 'invalid instruction' && exit 1
    fi
  done

  echo "$x" "$y" "$dir"
}

valid_dir() {
  case "$1" in
    north | east | south | west) return 0 ;;
    *) echo 'invalid direction' && return 1 ;;
  esac
}

main() {
  [ "$1" = "" ] && start_x=0 || start_x="$1"
  [ "$2" = "" ] && start_y=0 || start_y="$2"

  [ "$3" = "" ] && start_dir=north || start_dir="$3"
  if ! valid_dir "$start_dir"; then
    exit 1
  fi

  [ "$4" != "" ] && instructions="$4"
  if [ -z "$instructions" ]; then
    echo "$start_x $start_y $start_dir"
    return
  fi

  update_position "$start_x" "$start_y" "$start_dir" "$instructions"
}

main "$@"
