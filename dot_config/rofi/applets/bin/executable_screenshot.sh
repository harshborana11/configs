#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Screenshot

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Screenshot'

if [[ "$theme" == *'type-1'* ]]; then
  list_col='1'
  list_row='5'
  win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
  list_col='1'
  list_row='5'
  win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
  list_col='1'
  list_row='5'
  win_width='520px'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
  list_col='5'
  list_row='1'
  win_width='670px'
fi

# Options
layout=$(cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
  option_1=" Capture Desktop"
  option_2=" Capture Area"
  option_3=" Capture Window"
  option_4=" Capture in 5s"
  option_5=" Capture in 10s"
else
  option_1=""
  option_2=""
  option_3=""
  option_4=""
  option_5=""
fi

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "window {width: $win_width;}" \
    -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Screenshot
time=$(date +%Y-%m-%d-%H-%M-%S)

if [[ ! -d "$dir" ]]; then
  echo "meh"
fi

# countdown
countdown() {
  for sec in $(seq $1 -1 1); do
    notify-send -t 1000 "Taking shot in: $sec"
    sleep 1
  done
}

# take shots
shotnow() {
  ~/.config/hypr/scripts/screenshot.sh m
}

shot5() {
  countdown '5'
  sleep 1 && ~/.config/hypr/scripts/screenshot.sh m
}

shot10() {
  countdown '10'
  sleep 1 && ~/.config/hypr/scripts/screenshot.sh m
}
shotwin() {
  ~/.config/hypr/scripts/screenshot.sh s
}

shotarea() {
  ~/.config/hypr/scripts/screenshot.sh s
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    shotnow
  elif [[ "$1" == '--opt2' ]]; then
    shotarea
  elif [[ "$1" == '--opt3' ]]; then
    shotwin
  elif [[ "$1" == '--opt4' ]]; then
    shot5
  elif [[ "$1" == '--opt5' ]]; then
    shot10
  fi
}

# Actions

chosen="$(run_rofi)"

id=$(echo "$chosen" | cut -d':' -f1)

case "$id" in
1) run_cmd --opt1 ;;
2) run_cmd --opt2 ;;
3) run_cmd --opt3 ;;
4) run_cmd --opt4 ;;
5) run_cmd --opt5 ;;
*) exit 1 ;;
esac
