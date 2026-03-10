{ config, pkgs, ... }:

{
  imports = [
    ./profiles/desktop.nix
  ];

  home.stateVersion = "25.11";
}
