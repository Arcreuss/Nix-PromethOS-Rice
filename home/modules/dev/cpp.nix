{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.clion
    clang-tools
    gdb
    git
    cmake
    ninja
    pkg-config
  ];
}
