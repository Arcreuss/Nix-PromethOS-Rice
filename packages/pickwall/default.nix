{ pkgs }:

pkgs.writeShellApplication {
  name = "pickwall";

  runtimeInputs = with pkgs; [
    rofi
    findutils
    coreutils
    libnotify
  ];

  text = builtins.readFile ./pickwall.sh;
}
