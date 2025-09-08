{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs ; [
      librewolf
      mullvad-browser
      thunderbird
      ayugram-desktop
      legcord
    ];
  };
}
