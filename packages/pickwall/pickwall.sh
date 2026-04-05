#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/pickwall"

mkdir -p "$CACHE_DIR"

if [ ! -d "$WALL_DIR" ]; then
    notify-send "Wallpaper directory not found: $WALL_DIR"
    exit 1
fi

generate_thumbnail() {
    local img="$1"
    local base
    base="$(basename "$img")"
    local thumb="$CACHE_DIR/${base}.png"

    if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
	magick "$img" -thumbnail 420x720^ -gravity center -extent 420x720 "$thumb"
    fi

    printf '%s\n' "$thumb"
}

# RANDOM MODE
if [ "${1:-}" = "random" ]; then
    RANDOM_WALL=$(find "$WALL_DIR" -maxdepth 1 -type f \
        \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
        | shuf -n 1)

    if [ -z "$RANDOM_WALL" ]; then
        notify-send "Wallpaper" "No Wallpaper found"
        exit 1
    fi

    setwall "$RANDOM_WALL"
    exit 0
fi

# Build rofi entries with thumbnails
ENTRIES=""
while IFS= read -r img; do
    base="$(basename "$img")"
    thumb="$(generate_thumbnail "$img")"
    ENTRIES+="${base}\0icon\x1f${thumb}\n"
done < <(
    find "$WALL_DIR" -maxdepth 1 -type f \
        \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
        | sort
)

CHOICE=$(printf "%b" "$ENTRIES" | rofi \
    -dmenu \
    -i \
    -p "Wallpaper" \
    -show-icons \
    -theme "$HOME/.config/rofi/wallpaper-theme.rasi")

if [ -z "$CHOICE" ]; then
    exit 0
fi

setwall "$WALL_DIR/$CHOICE"
