{ config, lib, pkgs, nixos-hardware, ... }:

{
  imports = [
    nixos-hardware.nixosModules.asus-zephyrus-ga402
  ];

  environment.systemPackages = with pkgs; [
    asusctl
  ];

  services = {
    supergfxd = {
      enable = true;
    };

    asusd = {
      enable = true;
      enableUserService = true;
    };
  };

  systemd = {
    services = {
      supergfxd = {
        path = [ pkgs.pciutils ];
      };
    };
  };
}
