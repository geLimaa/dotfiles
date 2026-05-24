#!/bin/bash

WALL_DIR="$HOME/Wallpapers"

selected_name=$(
  find "$WALL_DIR" -type f | while read -r img; do
    name=$(basename "$img")

    echo -en "$name\0icon\x1f$img\n"
  done | rofi -dmenu \
    -show-icons \
    -i \
    -p "Wallpaper" \
    -theme ~/.config/rofi/style-5.rasi
)

[ -z "$selected_name" ] && exit

selected=$(find "$WALL_DIR" -type f | grep "$selected_name")

ln -sf "$selected" ~/.current_wallpaper

awww img "$selected" \
  --transition-type outer \
  --transition-duration 1.5 \
  --transition-fps 144
