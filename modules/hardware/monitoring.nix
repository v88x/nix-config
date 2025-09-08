{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
    lshw
    usbutils
    vdpauinfo
    lm_sensors
    acpi
    btop
  ];
}

