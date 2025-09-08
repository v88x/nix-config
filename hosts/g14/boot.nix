{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [
        "mmc_core"
        "mmc_block"
        "nvme"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];

      luks.devices.crypted = {
        device = lib.mkForce "/dev/nvme0n1p2";
        allowDiscards = true;
        keyFileSize = 4096;
        keyFile = "/dev/disk/by-id/mmc-00000_0xcf100666";
      };
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [];
  };
}

