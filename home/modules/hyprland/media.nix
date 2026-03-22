{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    bindl = [
      ", XF86AudioMute, exec, playerctl play-pause"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];
  };
}
