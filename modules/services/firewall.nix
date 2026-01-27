{ ... }:
{
  networking.firewall = {
    enable = true;
    # Default stance: deny everything
    allowPing = false;
    # Open only what you explicitly use
    allowedTCPPorts = [
      22   # SSH
    ];
    allowedUDPPorts = [ ];
    # Don’t silently open ports via services
    autoLoadConntrackHelpers = false;
    # Logging 
    logRefusedConnections = true;
  };
}
