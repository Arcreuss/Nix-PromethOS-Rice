{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
  ];
}
