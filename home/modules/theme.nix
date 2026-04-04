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
      backend = "fastresize"
      colorspace = "lab"
      check_contrast = true

      [templates.rofi]
      template = 'rofi-colors.rasi'
      target = '~/.config/rofi/wallust/rofi-colors.rasi'
      
      [templates.kitty]
      template = "colors-kitty.conf"
      target = "~/.config/kitty/kitty-colors.conf"

      [templates.starship]
      template = "starship.toml"
      target = "~/.config/starship.toml"

      [templates.swaync]
      template = "swaync-colors.css"
      target = "~/.config/swaync/wallust/swaync-colors.css"

      [templates.waybar]
      template = "waybar-colors.css"
      target = "~/.config/waybar/wallust/waybar-colors.css"

      [templates.hyprlock]
      template = "hyprlock-colors.conf"
      target = "~/.config/hypr/hyprlock-colors.conf"
    '';
  };

  xdg.configFile."wallust/templates/colors-kitty.conf".source =
  ./kitty/colors-kitty.conf.template;

  xdg.configFile."wallust/templates/starship.toml".source =
  ./starship/starship.toml.template;

  xdg.configFile."wallust/templates/rofi-colors.rasi".source =
  ../modules/rofi/colors.rasi.template;

  xdg.configFile."wallust/templates/swaync-colors.css".source =
  ./hyprland/swaync/colors.css.template;

  xdg.configFile."wallust/templates/waybar-colors.css".source =
  ./waybar/colors.css.template;

  xdg.configFile."wallust/templates/hyprlock-colors.conf".source =
  ./hyprland/hyprlock/colors.conf.template;
}
