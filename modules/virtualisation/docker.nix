{ config, lib, pkgs, user, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      docker
      docker-buildx
    ];
  };

  virtualisation = {
    docker = {
      enable = true;
    };
    
  };

  users = {
    users = {
      ${user} = {
        extraGroups = ["docker"];
      };
    };
  };
}
