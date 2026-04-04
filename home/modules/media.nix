{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    vlc
    inputs.yt-x.packages.${pkgs.stdenv.hostPlatform.system}.default
    spotify
  ];
}
