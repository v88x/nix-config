{ config, pkgs, lib, user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    description = "Primary user";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };
}
