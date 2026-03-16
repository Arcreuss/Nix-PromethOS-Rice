{ pkgs }:

pkgs.writeShellApplication {
  name = "pickwall";

  runtimeInputs = with pkgs; [
    rofi
    findutils
    coreutils
  ];

  text = builtins.readFile ./pickwall.sh;
}
