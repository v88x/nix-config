{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      radeontop
      mesa
      vulkan-tools
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  systemd.services.radeontop = {
    description = "Radeon GPU monitoring daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.radeontop}/bin/radeontop -d 5";
      Restart = "always";
    };
  };
}

