{ pkgs, ... }:
{
  imports = [
    ./programs/theme.nix
    ./programs/neovim
    ./programs/mpris-proxy.nix
  ];
}
