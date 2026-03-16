#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"

if [ ! -d "$WALL_DIR" ]; then
    echo "Wallpaper directory not found: $WALL_DIR"
    exit 1
fi

CHOICE=$(
    find "$WALL_DIR" -maxdepth 1 -type f \
        \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) \
        -printf '%f\n' | sort | rofi -dmenu -i -p "Wallpaper"
)

if [ -z "$CHOICE" ]; then
    exit 0
fi

setwall "$WALL_DIR/$CHOICE"
