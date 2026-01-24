{ config, pkgs, ... }:
{
  # Thermals management :
  services.thermald.enable = true;

  hardware.cpu.intel.updateMicrocode = true;
}
