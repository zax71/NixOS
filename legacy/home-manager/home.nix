{ pkgs, ... }:
{
  imports = [
    ./programs/theme.nix
    ./programs/picom.nix
    ./programs/kitty.nix
    ./programs/rofi.nix
    ./programs/neovim
    ./programs/mpris-proxy.nix
    ./programs/awesome
    ./programs/vscodium.nix
  ];
}
