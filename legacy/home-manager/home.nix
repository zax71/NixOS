{ pkgs, ... }:
{
  imports = [
    ./programs/theme.nix
    ./programs/rofi.nix
    ./programs/neovim
    ./programs/mpris-proxy.nix
  ];
}
