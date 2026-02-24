
{ config, pkgs, ... }:

{
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.git.enable = true;

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -lah";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#nixos";
      cat = "bat";
    };
    
    initContent = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };
  
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
  };

  home.packages = with pkgs; [
    bat
    eza
    tree
    fastfetch
    btop
    cmatrix
    cava
  ];
}

