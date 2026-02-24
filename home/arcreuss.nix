{ config, pkgs, ... }:

{
  imports = [
    ./modules/core.nix
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/wayland-tools.nix
    ./modules/hyprland.nix
    ./modules/gtk.nix
    ./modules/dev.nix
    ./modules/apps.nix
    ./modules/media.nix
    ./modules/theme.nix
  ];

  home.stateVersion = "25.11";
}
