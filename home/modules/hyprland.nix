{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = [
        "DP-1,2560x1440@164.83,0x0,1"
	"DP-3,2560x1440@143.97,2560x0,1"
      ];

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

        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, D, exec, rofi -show drun"
        "$mod, BACKSPACE, exec, hyprlock"

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

	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"

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
    };
  };

  home.packages = with pkgs; [
    waybar
    kitty
    hyprlock
  ];
}
