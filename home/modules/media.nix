{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    pamixer
    vlc
    inputs.yt-x.packages.${pkgs.stdenv.hostPlatform.system}.default
    spotify
  ];
}
