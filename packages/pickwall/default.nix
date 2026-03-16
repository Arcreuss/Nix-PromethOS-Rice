{ pkgs, setwall }:

pkgs.writeShellApplication {
  name = "pickwall";

  runtimeInputs = with pkgs; [
    rofi
    findutils
    coreutils
    libnotify
    setwall
  ];

  text = builtins.readFile ./pickwall.sh;
}
