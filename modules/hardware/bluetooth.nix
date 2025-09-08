{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        AutoEnable = true;
        Discoverable = false;
        DiscoverableTimeout = 0;
      };
    };
  };
}

