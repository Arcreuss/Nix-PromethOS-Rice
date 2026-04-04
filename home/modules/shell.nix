
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
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#promethos-desktop";
      nix-update = "cd /etc/nixos && nix flake update && sudo nixos-rebuild switch --flake .#promethos-desktop";
      conf = "cd /etc/nixos";
    };
    
    initContent = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };
  
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
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

