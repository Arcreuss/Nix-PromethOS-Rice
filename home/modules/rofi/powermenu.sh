#!/usr/bin/env bash

options="󰤄  Lock\n󰍃  Logout\n󰜉  Reboot\n󰐥  Shutdown"

choice=$(printf "%b\n" "$options" | rofi -dmenu -i -p "Power" -theme ~/.config/rofi/powermenu.rasi)
[ -z "$choice" ] && exit 0

confirm() {
    ans=$(printf "No\nYes\n" | rofi -dmenu -i -p "$1" -theme ~/.config/rofi/powermenu.rasi)
    [ "$ans" = "Yes" ]
}

case "$choice" in
  *Lock*)
    hyprlock
    ;;
  *Logout*)
    confirm "Logout?" && hyprctl dispatch exit
    ;;
  *Reboot*)
    confirm "Reboot?" && systemctl reboot
    ;;
  *Shutdown*)
    confirm "Shutdown?" && systemctl poweroff
    ;;
  *)
    exit 0
    ;;
esac
