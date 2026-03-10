{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 8;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = false;
          format = "{id}";
	  sort-by-number = true;
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 60;
        };

        clock = {
	  interval = 1;
          format = "  {:%H:%M:%S}";
          format-alt = "  {:%A %d %B %Y}";
          tooltip-format = "<big>{:%A %d %B %Y}</big>\n<tt>{calendar}</tt>";
        };

        cpu = {
          format = "  {usage}%";
          tooltip = true;
        };

        memory = {
          format = "  {}%";
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈀  Wired";
          format-disconnected = "󰖪  Offline";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟  muted";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        tray = {
          spacing = 10;
        };
      }
    ];

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: JetBrainsMono Nerd Font, monospace;
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(20, 20, 20, 0.92);
        color: #e6e6e6;
      }

      #workspaces {
        margin: 0 6px;
      }

      #workspaces button {
        padding: 0 8px;
        color: #cfcfcf;
        background: transparent;
      }

      #workspaces button.active {
        background: #3a3a3a;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: #505050;
        color: #ffffff;
      }

      #window {
        margin: 0 10px;
        font-weight: bold;
      }

      #clock,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #tray {
        margin: 0 8px;
        padding: 0 6px;
      }
    '';
  };
}
