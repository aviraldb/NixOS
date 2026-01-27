{ pkgs, ... } : 
{
environment.systemPackages = with pkgs; [
  mpv
  ffmpeg
  spotify
  cmus
  playerctl
  imagemagick
  qbittorrent
];
}
