{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    plymouth
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    consoleLogLevel = 3;
    kernelParams = [
      "ipv6.disable=1"
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "plymouth.use-simpledrm"
    ];
    plymouth.enable = true;
  };
}
