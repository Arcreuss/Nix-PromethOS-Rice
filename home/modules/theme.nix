{ config, pkgs, ... }:

let
  setwallPkg = import ../../packages/setwall { inherit pkgs; };
  pickwallPkg = import ../../packages/pickwall {
    inherit pkgs;
    setwall = setwallPkg;
  };
in
{
  home.packages = with pkgs; [
    # Font pour Kitty / Starship / icons
    nerd-fonts.jetbrains-mono
    wallust
    setwallPkg
    pickwallPkg
  ];
  
  # Config Wallust
  xdg.configFile."wallust/config.toml".text = ''
    backend = "full"
    colorspace = "lab"
    check_contrast = true
  '';
}
