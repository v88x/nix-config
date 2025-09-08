{ config, pkgs, lib, ... }:

{
  services = {
    # Intel Thermal Daemon (если есть Intel CPU)
    thermald.enable = true;

    # TLP работает на ноутбуках, но включаем его явно
    tlp.enable = true;
  };

  powerManagement = {
    enable = true;
  };

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "suspend";
  };
}

