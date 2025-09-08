{ config, lib, pkgs, pkgsUnstable, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      git
      cachix
      vim
    ];
  };
};
