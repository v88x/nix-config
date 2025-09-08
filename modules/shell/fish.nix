{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fish
  ];

  programs.fish = {
    enable = true;
  };

  programs.ssh.startAgent = true;
}
