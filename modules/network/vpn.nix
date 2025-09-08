{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      clash-verge-rev
      mullvad-vpn
    ];
  };
  services.mullvad-vpn.enable = true;
  programs.clash-verge.enable = true;
}
