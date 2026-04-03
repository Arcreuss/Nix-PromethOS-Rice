{ ... }:

{
  imports = [
    ../modules/core.nix
    ../modules/shell.nix
    ../modules/terminal.nix
    ../modules/wayland-tools.nix

    ../modules/hyprland/base.nix
    ../modules/hyprland/desktop.nix
    ../modules/hyprland/media.nix
    ../modules/hyprland/screenshot.nix
    ../modules/hyprland/notifications.nix

    ../modules/waybar/waybar.nix
    ../modules/gtk.nix
    ../modules/dev.nix
    
    ../modules/apps.nix
    ../modules/media.nix
    ../modules/theme.nix
    ../modules/rofi/rofi.nix
  ];
}
