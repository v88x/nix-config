{ config, pkgs, lib, system, user, ... }:

let
  ovmfExists = builtins.pathExists "${pkgs.OVMF.fd}/FV/OVMF.fd";
  enableUEFI = ovmfExists && builtins.elem system [ "x86_64-linux" "aarch64-linux" ];
  biosOption = lib.optionalString enableUEFI "-bios ${pkgs.OVMF.fd}/FV/OVMF.fd";
in
{
  environment.systemPackages = with pkgs; [
    virtiofsd
    libvirt
    qemu_kvm
    virt-manager
    spice-gtk

    (pkgs.writeShellScriptBin "qemu-system-${system}" ''
      qemu-system-${system} ${biosOption} "$@"
    '')
  ];

  virtualisation.libvirtd.enable = true;

  users.users.${user}.extraGroups = [ "libvirtd" ];
}
