{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs ; [
      virt-manager
    ];
  };
}
