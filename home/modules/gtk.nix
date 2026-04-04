{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dconf
    gnome-themes-extra
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-theme-name = "Adwaita";
      gtk-application-prefer-dark-theme = true;
    };
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":close";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Adwaita";
    };
  };
}
