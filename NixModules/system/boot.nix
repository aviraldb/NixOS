{ config, pkgs, lib, ... }:

{
  options.mySystem.boot = {
    useLatestKernel = lib.mkEnableOption "use latest kernel";
    bootloader = lib.mkOption {
      type = lib.types.enum [ "grub" "systemd-boot" ];
      default = "systemd-boot";
      description = "Which bootloader to use";
    };
  };

  config = lib.mkMerge [
    # Latest kernel if enabled
    (lib.mkIf config.mySystem.boot.useLatestKernel {
      boot.kernelPackages = pkgs.linuxPackages_latest;
    })
    
    # Bootloader configuration
    (lib.mkIf (config.mySystem.boot.bootloader == "systemd-boot") {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })
    
    (lib.mkIf (config.mySystem.boot.bootloader == "grub") {
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "nodev";
      boot.loader.grub.efiSupport = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })
  ];
}
