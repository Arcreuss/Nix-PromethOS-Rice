{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord-canary
    easyeffects
    rnote
    (import ../../packages/setwall { inherit pkgs; })
  ];
}
