{ pkgs, ... } : 
{
environment.systemPackages = with pkgs; [
  gcc
  clang
  make
  cmake
  ninja
  gdb

  python
  python-pip

  nodejs
  npm

  rustup
  go

  docker
];
}
