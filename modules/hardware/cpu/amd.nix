{ config, pkgs, ... }:
{
  # Enable power profiles - 
  services.power-profiles-daemon.enable = true;

  hardware.cpu.amd.updateMicrocode = true;
}
