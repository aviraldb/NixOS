{ pkgs, ... } : 
{
environment.systemPackages = with pkgs; [
  zsh
  tmux
  vim
  neovim
  wget
  curl
  tree
  htop
  btop
  ripgrep
  fd
  fzf
  eza
  bat
  less
  which
  file
  tldr
  fastfetch
  zoxide
];
}
