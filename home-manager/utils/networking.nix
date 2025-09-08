{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      netcat
      curl
      wget
      nmap
      p0f
      tcpdump
      wireshark
      rustscan
    ];
  };
}
