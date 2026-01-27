{ ... }:
let
  mkUser = { user, ssh_keys }:
    {
      isNormalUser = true;
      home = "/home/${user}";
      description = "${user}'s Home Directory";
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      openssh.authorizedKeys.keys = ssh_keys;
    };
in
{
  users.users = {
    aviral = mkUser {
      user = "aviral";
      ssh_keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECAFBvRXz9S5jU1GPz1Pyq1Onjvn/UtKFMMWLe4mIDk aviralkmdubey@gmail.com"
      ];
    };
  };
}
