{ ... }:

{
  # No GUI — ever
  services.xserver.enable = false;
  # No sound stack
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  # Reduce boot noise
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
  ];
  # Enable SSH (headless means remote-only)
  services.openssh.enable = true;
  # Faster, cleaner boot
  systemd.services."getty@tty1".enable = false;
  # Power management kept minimal
  powerManagement.enable = false;
  # Journald discipline
  services.journald.extraConfig = ''
    SystemMaxUse=200M
    RuntimeMaxUse=100M
  '';
}
