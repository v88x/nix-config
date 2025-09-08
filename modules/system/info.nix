{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    ncdu
    hping
    microfetch
    tree
    inetutils
  ];
}
