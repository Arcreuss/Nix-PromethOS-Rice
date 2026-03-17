#!/usr/bin/env bash

WALLPAPER="$1"

if [ ! -f "$WALLPAPER" ]; then
  echo "File not found: $WALLPAPER"
  exit 1
fi

if [ -z "$WALLPAPER" ]; then
    echo "Usage: setwall <wallpaper>"
    exit 1
fi

# set wallpaper
swww img "$WALLPAPER" --transition-type grow --transition-duration 1

# generate palette / -q for quiet log
wallust run "$WALLPAPER" -q 

# reload UI
pkill waybar || true
waybar >/dev/null 2>&1 & disown

hyprctl reload
notify-send "Wallpaper updated" "$(basename "$WALLPAPER")"
