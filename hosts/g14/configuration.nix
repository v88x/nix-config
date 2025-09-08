{ pkgs, lib, stateVersion, hostname, user, nixos-hardware, disko, home-manager, ... }:

{
  imports = [
    ./boot.nix
    ./disko.nix
    ./hardware.nix
    ./user.nix
    ./../../modules/nix/nix.nix
    ./../../modules/nix/nh.nix
    ./../../modules/hardware/cpu/amd.nix
    ./../../modules/hardware/gpu/amd.nix
    ./../../modules/hardware/sound/pipewire.nix
    ./../../modules/hardware/backlight.nix
    ./../../modules/hardware/bluetooth.nix
    ./../../modules/hardware/power.nix
    ./../../modules/hardware/monitoring.nix
    ./../../modules/network/avahi.nix
    ./../../modules/network/manager.nix
    ./../../modules/network/firewall.nix
    ./../../modules/network/hosts.nix
    ./../../modules/network/vpn.nix
    ./../../modules/security/selinux.nix
    ./../../modules/security/tweaks.nix
    ./../../modules/shell/fish.nix
    ./../../modules/system/boot.nix
    ./../../modules/system/firmware.nix
    ./../../modules/system/info.nix
    ./../../modules/system/kernel.nix
    ./../../modules/system/timezone.nix
    ./../../modules/virtualisation/docker.nix
    ./../../modules/virtualisation/kvm.nix
    ./../../modules/desktop/fonts.nix
    ./../../modules/desktop/gamemode.nix
    ./../../modules/desktop/qt.nix
    ./../../modules/desktop/hyprland/hyprland.nix
    disko.nixosModules.disko
    home-manager.nixosModules.home-manager
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}
