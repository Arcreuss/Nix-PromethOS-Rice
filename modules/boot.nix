
{ config, pkgs, ... }:

{
  # Bootloader. (GRUB + UEFI)
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.resumeDevice = "/dev/disk/by-uuid/44d023ca-9ccb-44f2-a16a-13bc21c117f6";
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
