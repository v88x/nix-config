{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      pamixer
    ];
  };

  services = {
    pulseaudio = {
      enable = false;
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse = {
        enable = true;
      };

      wireplumber = {
        enable = true;
      };
    };
  };
}
