{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Font pour Kitty / Starship / icons
    nerd-fonts.jetbrains-mono
    wallust
    (import ../../packages/setwall { inherit pkgs; })
  ];
  
  # Config Wallust
  xdg.configFile."wallust/config.toml".text = ''
    backend = "full"
    colorspace = "lab"
    check_contrast = true
  '';
}
