{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      go
      gcc
      cmake
      ninja
      nodejs
      devenv
      figma-linux
      pre-commit
    ];
  };
}
