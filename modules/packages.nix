
{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    efibootmgr
    os-prober
  ];
  
  programs.zsh.enable = true;
}
