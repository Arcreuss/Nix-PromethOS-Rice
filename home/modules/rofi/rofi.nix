{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = ./rofi-theme.rasi;

    extraConfig = {
      show-icons = true;
      display-drun = "Apps :";
      drun-display-format = "{name}";
    };
  };

  home.file.".config/rofi/powermenu.sh" = {
    source = ./powermenu.sh;
    executable = true;
  };

  xdg.configFile."rofi/wallpaper-theme.rasi".source = ./wallpaper-theme.rasi;
  xdg.configFile."rofi/powermenu.rasi".source = ./powermenu.rasi;
}
