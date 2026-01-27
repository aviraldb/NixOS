{ pkgs, ... } : 
{
environment.systemPackages = with pkgs; [
  noto-fonts
  noto-fonts-emoji
  jetbrains-mono
  nerd-fonts.fira-code
  nerd-fonts.jetbrains-mono
];
}
