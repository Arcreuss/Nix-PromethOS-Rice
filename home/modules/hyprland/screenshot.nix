{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swappy
    libnotify
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      # Print → zone → save + clipboard
      ", Print, exec, grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy && notify-send 'Screenshot' 'Saved + Copied'"

      # Super + Print → zone → swappy (édition) + clipboard
      "$mod, Print, exec, grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | swappy -f - && notify-send 'Screenshot' 'Editing'"

      # Shift + Print → écran DP-1 → save + clipboard
      "SHIFT, Print, exec, grim -o DP-1 - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy && notify-send 'Screenshot' 'Screen Saved + Copied'"
    ];
  };

  home.file."Pictures/Screenshots/.keep".text = "";
  
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=$HOME/Pictures/Screenshots
    save_filename_format=%Y-%m-%d_%H-%M-%S.png
  '';
}
