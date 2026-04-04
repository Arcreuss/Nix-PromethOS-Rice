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

    ADW_DISABLE_PORTAL = "1";
  };
  
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Arcreuss";
        email = "63006702+Arcreuss@users.noreply.github.com";
      };

      alias = {
        st = "status -sb";
        co = "checkout";
        br = "branch";
        lg = "log --oneline --graph --decorate --all";
      };

      # extraConfig
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  }; 
}
