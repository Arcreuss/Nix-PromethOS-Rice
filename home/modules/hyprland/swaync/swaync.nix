{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  wayland.windowManager.hyprland.settings.bind = [
      "$mod, N, exec, swaync-client -t"
  ];

  xdg.configFile."swaync/config.json".source = ./config.json;
  xdg.configFile."swaync/style.css".source = ./style.css;
}
