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
  xdg.configFile."wallust/wallust.toml" = {
    force = true;
    text = ''
      backend = "full"
      colorspace = "lab"
      check_contrast = true

      [templates.rofi]
      template = 'rofi-colors.rasi'
      target = '~/.config/rofi/colors.rasi'
      
      [templates.kitty]
      template = "colors-kitty.conf"
      target = "~/.config/kitty/kitty-colors.conf"

      [templates.starship]
      template = "starship.toml"
      target = "~/.config/starship.toml"
    '';
  };

  xdg.configFile."wallust/templates/rofi-colors.rasi".source =
  ../modules/rofi/colors.rasi.template;
}
