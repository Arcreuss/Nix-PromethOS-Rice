{ pkgs, ... }:

{
  home.packages = with pkgs; [
    reaper
    carla
    guitarix

    lsp-plugins
    calf
    x42-plugins
    zam-plugins

    pipewire.jack
  ];
}
