{ config, lib, pkgs, ... }:

{
  networking = {
    nameservers = [ "9.9.9.9#dns.quad9.net" ];
    networkmanager = {
      enable = true;
      wifi.powersave = true;
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };
  };
}
