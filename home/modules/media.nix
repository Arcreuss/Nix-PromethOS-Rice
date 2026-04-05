{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    pamixer
    vlc
    rmpc
    inputs.yt-x.packages.${pkgs.stdenv.hostPlatform.system}.default
    spotify
  ];
}
