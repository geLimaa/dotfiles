#!/bin/bash

THEMES_DIR="$HOME/.config/colorschemes"

theme=$(find "$THEMES_DIR" -mindepth 1 -maxdepth 1 -type d |
  xargs -n1 basename |
  rofi -dmenu \
    -i \
    -p "Theme" \
    -theme ~/.config/rofi/style-5.rasi)

[ -z "$theme" ] && exit

# ─────────────────────────────
# HYPRLAND
# colors -> custom
# ─────────────────────────────
ln -sfn "$HOME/.config/hypr/colors/custom/$theme.conf" \
  "$HOME/.config/hypr/colors/colors.conf"

# ─────────────────────────────
# WAYBAR
# colors -> custom
# ─────────────────────────────
ln -sfn "$HOME/.config/waybar/colors/custom/$theme.css" \
  "$HOME/.config/waybar/colors/colors.css"

# ─────────────────────────────
# KITTY
# colors -> custom
# ─────────────────────────────
ln -sfn "$HOME/.config/kitty/colors/custom/$theme.conf" \
  "$HOME/.config/kitty/colors/colors.conf"

# ─────────────────────────────
# RELOADS
# ─────────────────────────────
hyprctl reload

pkill waybar 2>/dev/null
waybar &

killall -SIGUSR1 kitty 2>/dev/null
