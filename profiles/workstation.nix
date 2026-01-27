{ pkgs, ... }:
{
  # dbus service :
  services.dbus.enable = true;

  # polkit agent :
  security.polkit.enable = true;

  # dconf service : 
  programs.dconf.enable = true;

  # XDG service :
  xdg.portal.enable = true;

  # Fonts :
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };
}
