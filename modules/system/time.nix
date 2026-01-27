{ ... }:
{
  # Set your local timezone
  time.timeZone = "Asia/Kolkata";

  # Use systemd-timesyncd
  services.timesyncd = {
    enable = true;

    servers = [
      "0.in.pool.ntp.org"
      "1.in.pool.ntp.org"
      "2.in.pool.ntp.org"
      "3.in.pool.ntp.org"
    ];
  };

  # Keep hardware clock in UTC 
  time.hardwareClockInLocalTime = false;
}
