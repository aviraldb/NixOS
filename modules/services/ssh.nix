{ ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      # Never allow root login
      PermitRootLogin = "no";
      # Password auth is weak — keys only
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      # Modern SSH only
      X11Forwarding = false;
      AllowTcpForwarding = "no";
      AllowAgentForwarding = false;
      # Keep connections alive
      ClientAliveInterval = 300;
      ClientAliveCountMax = 2;
      # Clean logging
      LogLevel = "VERBOSE";
    };
    # Strong crypto defaults
    extraConfig = ''
      Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com
      MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com
      KexAlgorithms curve25519-sha256
    '';
  };
  # Firewall: open SSH only if you actually use it remotely
  networking.firewall.allowedTCPPorts = [ 22 ];
}
