{ ... }:
{
  # enable flatpak and appimage support :
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # sec-custom-packages-prebuilt
  # https://nixos.org/manual/nixos/unstable/
}
