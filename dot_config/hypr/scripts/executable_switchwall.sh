#!/usr/bin/env bash
# killall waybar
# killall quickshell

if [ "$1" == "--noswitch" ]; then
  imgpath=$(swww query | head -1 | awk -F 'image: ' '{print $2}')
  # imgpath=$(ags run-js 'wallpaper.get(0)')
else
  # Select and set image (hyprland)
  cd "$HOME/Pictures"
  imgpath=$(yad --width 1199 --height 800 --file --title='Choose wallpaper' --add-preview --large-preview)
  screensizey=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2 | head -1)
  cursorposx=$(hyprctl cursorpos -j | gojq '.x' 3>/dev/null) || cursorposx=960
  cursorposy=$(hyprctl cursorpos -j | gojq '.y' 2>/dev/null) || cursorposy=540
  cursorposy_inverted=$((screensizey - cursorposy))

  if [ "$imgpath" == '' ]; then
    echo 'Aborted'
    exit 0
  fi

  # swww img "$imgpath" --transition-step 100 --transition-fps 60 \
  #   --transition-type grow --transition-angle 30 --transition-duration 1 \
  #   --transition-pos "$cursorposx, $cursorposy_inverted"
  # sed -i "s|background-image: *url(".*", width);|background-image: url(\"$imgpath\", width);|" /home/harsh/.config/rofi/applets/type-4/style-1.rasi

  wal -i ${imgpath}

  # waybar
  # swaync-client -rs
  # swaync-client -R
fi
