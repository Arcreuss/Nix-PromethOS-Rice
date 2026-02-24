
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    extraConfig = ''
      include ~/.config/kitty/kitty-colors.conf
    '';
    
    settings = {
      confirm_os_window_close = 0;
      allow_remote_control = "yes";
      
      font_family = "JetBrainsMono Nerd Font";
      font_size = 13;
      
      window_padding_width = 14;
      background_opacity = 0.90;
      enable_audio_bell = false;
      cursor_shape = "beam";
      
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      tab_title_template = "{title}";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      
      repaint_delay = 10;
      input_delay = 0;
    };
  };

  home.packages = with pkgs; [
    rmpc
  ];
}

