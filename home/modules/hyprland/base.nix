{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      workspace = [
        "1,monitor:DP-1"
	"2,monitor:DP-3"
	"3,monitor:DP-1"
	"4,monitor:DP-3"
      ];

      exec-once = [
        # start the daemon only if it doesn't exist yet
	"pgrep -x swww-daemon >/dev/null || swww-daemon"

	# Apply the wallpaper
	"sleep 0.5 && swww img ~/Pictures/Wallpapers/green_dinasour.png"

	"waybar"
        "swww init"
      ];

      bind = [
        "$mod, R, exec, hyprctl reload"
	"$mod, W, exec, swww img ~/Pictures/Wallpapapers/green_dinasour.png"

        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, Delete, exit"
        "$mod, D, exec, rofi -show drun"
        "$mod, BackSpace, exec, hyprlock"

	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"

	"$mod SHIFT, H, movewindow, l"
	"$mod SHIFT, L, movewindow, r"
	"$mod SHIFT, K, movewindow, u"
	"$mod SHIFT, J, movewindow, d"

	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"

	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"

	# Focus monitor (l/r)
	"$mod, comma, focusmonitor, -1"
	"$mod, period, focusmonitor, +1"

	# Move active window to monitor (l/r)
	"$mod SHIFT, comma, movewindow, mon:-1"
	"$mod SHIFT, period, movewindow, mon:+1"

	# Move current workspace to monitor (l/r)
	"$mod CTRL, comma, movecurrentworkspacetomonitor, -1"
	"$mod CTRL, period, movecurrentworkspacetomonitor, +1"

	# Scroll workspace + preview next/prev
	"$mod, mouse_down, workspace, e+1"
	"$mod, mouse_up, workspace, e-1"
	"$mod, Tab, workspace, e+1"
	"$mod SHIFT, Tab, workspace, e-1"

	"$mod, R, submap, resize"
	"$mod, M, submap, move"
      ];

      input = {
        kb_layout = "us";
	kb_variant = "intl";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 8;
      };

      animations = {
        enabled = true;
      };

      windowrulev2 = [
        "float, class:^(org.pulseaudio.pavucontrol)$"
	"float, title:^(Open File|Save File|Choose Files)$"
	"workspace 2, class:^(discord-canary)$"
	"workspace 2, class:^(Spotify)$"
      ];
    };
    # End Settings Section 

    extraConfig = ''
      submap=resize
      bind=,H,resizeactive,-20 0
      bind=,L,resizeactive, 20 0
      bind=,K,resizeactive,0 -20
      bind=,J,resizeactive,0  20
      
      bind=,N,movefocus,l
      bind=,M,movefocus,d
      bind=,comma,movefocus,u
      bind=,period,movefocus,r

      
      bind=,Return,submap,reset
      bind=,Escape,submap,reset
      bind=,BackSpace,submap,reset
      submap=reset

      submap=move
      bind=,H,movewindow,l
      bind=,L,movewindow,r
      bind=,K,movewindow,u
      bind=,J,movewindow,d

      bind=,F,togglefloating
      bind=,P,pseudo

      bind=,Escape,submap,reset
      bind=,Return,submap,reset
      bind=,BackSpace,submap,reset
      submap=reset
    '';
    # End ExtraConfig Section

  };
  # End Wayland.WindowManager.Hyprland Section

  home.packages = with pkgs; [
    waybar
    kitty
    hyprlock
  ];
}
