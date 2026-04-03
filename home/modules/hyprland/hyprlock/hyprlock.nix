{ pkgs, ... }:

{
  programs.hyprlock.enable = true;

  wayland.windowManager.hyprland.settings.bind = [
      "$mod, BackSpace, exec, hyprlock"
  ];

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
}
