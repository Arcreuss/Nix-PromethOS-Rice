{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    vlc
    inputs.yt-x.packages.${pkgs.system}.default
    spotify
  ];
}
