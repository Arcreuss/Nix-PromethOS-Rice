{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = false;
  };
  
  home.packages = with pkgs; [
    yazi
    ripgrep
    fd
    lazygit
    fzf
    chafa
  ];
}

