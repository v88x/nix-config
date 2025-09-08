{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];

      luks.devices."crypted" = {
        device = lib.mkForce "/dev/nvme0n1p2";
        allowDiscards = true;

        keyFile = "/dev/disk/by-uuid/0403-0201/luks.key";
      };
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [];
  };
}

