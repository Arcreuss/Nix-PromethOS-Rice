
{ config, pkgs, ... }:

{
  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes"];
  };
}
