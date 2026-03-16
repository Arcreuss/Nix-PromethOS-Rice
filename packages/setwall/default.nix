{ pkgs }:

pkgs.writeShellApplication {
  name = "setwall";

  runtimeInputs = with pkgs; [
    swww
    wallust
    waybar
    hyprland
    libnotify
  ];

  text = builtins.readFile ./setwall.sh;
}
