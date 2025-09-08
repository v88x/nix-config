{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      gh
      jq
      zip
      unzip
      p7zip
      ripgrep
    ];
  };
}
