
{ config, pkgs, ... }:

{
  # Bootloader. (GRUB + UEFI)
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.resumeDevice = "/dev/disk/by-uuid/e4ce1c6d-84d6-4898-9dae-699dfe936d8b";
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    devices = [ "nodev" ];
  };
  
  # Optimization ZRam
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  # OOM
  systemd.oomd.enable = true;

  # Scheduler CPU
  powerManagement.cpuFreqGovernor = "schedutil";
}
