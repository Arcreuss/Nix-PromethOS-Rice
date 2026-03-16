{ pkgs }:

pkgs.writeShellApplication {
  name = "setwall";

  runtimeInputs = with pkgs; [
    swww
    wallust
    waybar
    hyprland
  ];

  text = builtins.readFile ./setwall.sh;
}
