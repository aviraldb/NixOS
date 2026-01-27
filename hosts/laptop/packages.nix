{ pkgs, ... }:
{
  imports = [
    # -------------------------------------
    # Packages :
    # -------------------------------------
    ../../packages/editors.nix
    ../../packages/terminal.nix

  ];
}
