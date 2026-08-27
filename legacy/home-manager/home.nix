{ pkgs, ... }:
{
  imports = [
    ./programs/theme.nix
    ./programs/picom.nix
    ./programs/rofi.nix
    ./programs/neovim
    ./programs/mpris-proxy.nix
    ./programs/vscodium.nix
  ];
}
