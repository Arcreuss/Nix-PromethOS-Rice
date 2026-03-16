{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Wallpaper daemon (Wayland)
    swww

    # Launcher Wayland
    rofi

    # Clipboard Wayland
    wl-clipboard

    # Screenshots (indispensable sous Wayland)
    grim
    slurp

    # Color picker pratique
    hyprpicker

    # Notification daemon
    mako
  ];
}
