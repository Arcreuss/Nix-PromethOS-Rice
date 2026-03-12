{ pkgs, ... }:

{
  home.username = "arcreuss";
  home.homeDirectory = "/home/arcreuss";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };
  
  programs.git = {
    enable = true;

    userName = "Arcreuss";
    userEmail = "63006702+Arcreuss@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };

    aliases = {
      st = "status -sb";
      co = "checkout";
      br = "branch";
      lg = "log --oneline --graph --decorate --all";
    };
  }; 
}
