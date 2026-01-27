{ ... }:
{
  # Servers must be boring
  documentation.enable = false;
  # No automatic upgrades unless you choose
  system.autoUpgrade.enable = false;
  # Prefer stability
  nix.settings = {
    auto-optimise-store = true;
    warn-dirty = false;
  };
  # Kernel tuning (safe defaults)
  boot.kernel.sysctl = {
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.ip_forward" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;
  };
  # No Bluetooth, ever
  hardware.bluetooth.enable = false;
  # Predictable logs
  services.journald.extraConfig = ''
    Storage=persistent
    Compress=yes
    SystemMaxUse=500M
  '';
  # Time must always be correct on servers
  services.timesyncd.enable = true;
  # Prevent accidental power actions
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleRebootKey=ignore
    HandleSuspendKey=ignore
  '';
}
