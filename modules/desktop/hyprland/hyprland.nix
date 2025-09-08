{ pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      hyprland
      hypridle
      hyprlock
      hyprpaper
      hyprcursor
      waybar
      wl-clipboard
      libnotify
      swaynotificationcenter
      rofi
      kitty
      rose-pine-hyprcursor
    ];
  };

  programs = {
    hyprland = {
      enable = true;
    };

    hyprlock = {
      enable = true;
    };
  };

  services = {
    hypridle = {
      enable = true;
    };
  };
}
