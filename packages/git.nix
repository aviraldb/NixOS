{ pkgs, ... } : 
{
environment.systemPackages = with pkgs; [
  git
  github-cli
  lazygit
];
}
