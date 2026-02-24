{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    rnote
  ];
}
