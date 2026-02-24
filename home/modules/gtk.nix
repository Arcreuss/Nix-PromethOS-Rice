{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # Optionnel mais souvent utile pour forcer la préférence dark
  dconf.enable = true;
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
