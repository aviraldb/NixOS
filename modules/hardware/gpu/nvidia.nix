{ ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };
  hardware.graphics.enable32Bit = true;
  boot.kernelParams = [
    "nvidia_drm.modeset=1"
  ];
}
