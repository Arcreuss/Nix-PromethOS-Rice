
{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    vim
    wget
    curl
    firefox
    pavucontrol
    blueman
    wev
    playerctl
  ];
}
