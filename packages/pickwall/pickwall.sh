#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"

if [ ! -d "$WALL_DIR" ]; then
    echo "Wallpaper directory not found: $WALL_DIR"
    exit 1
fi

# Random Mode
if [ "$1" = "random" ]; then
    RANDOM_WALL=$(find "$WALL_DIR" -type f\
        \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
	| shuf -n 1)

        if [ -z "$RANDOM_WALL" ]; then
	    echo "No wallpapers found"
	    exit 1
	fi

	setwall "$RANDOM_WALL"
	notify-send "Wallpaper" "Random wallpaper applied"
	exit 0
fi

# Normal Picker
CHOICE=$(
    find "$WALL_DIR" -maxdepth 1 -type f \
        \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) \
        -printf '%f\n' | sort | rofi -dmenu -i -p "Wallpaper"
)

if [ -z "$CHOICE" ]; then
    exit 0
fi

setwall "$WALL_DIR/$CHOICE"
