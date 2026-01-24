{ pkgs, ... }:
{
  services.xserver.videoDrivers = [ "intel" ];
  boot.initrd.kernelModules = [ "i915" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      libvdpau-va-gl
    ];
  };
}
