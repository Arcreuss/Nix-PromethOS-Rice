{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  
  programs.git = {
    enable = true;

    userName = "Arcreuss";
    userEmail = "63006702+Arcreuss@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.reabse = false;
      push.autoSetupRemote = true;
    };

    aliases = {
      st = "status -sb";
      co = "checkout";
      br = "branch";
      lg = "log --oneline --graph --decorate --all";
    };
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

