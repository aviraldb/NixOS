{ pkgs, ... }:
{
  imports = [
    # -------------------------------------
    # Modules :- 
    # -------------------------------------
    ../../modules/system/boot/grub.nix
    ../../modules/system/locale.nix
    ../../modules/system/network.nix
    ../../modules/system/sound.nix
    ../../modules/system/time.nix

    ../../modules/hardware/cpu/intel.nix
    ../../modules/hardware/gpu/nvidia.nix
    ../../modules/hardware/backlights.nix
    ../../modules/hardware/firmware.nix
    ../../modules/hardware/nvme.nix

    ../../modules/services/bluetooth.nix
    ../../modules/services/ssh.nix
    ../../modules/services/firewall.nix

  ];
}
