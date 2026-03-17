{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = ./rofi-theme.rasi;

    extraConfig = {
      show-icons = true;
      display-drun = "Apps";
      drun-display-format = "{name}";
    };
  };
}
