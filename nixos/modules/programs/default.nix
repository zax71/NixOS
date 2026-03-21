{ pkgs, ... }:
{
  imports = [
    ./java.nix
    ./zsh.nix
    ./dconf.nix
    ./steam.nix
  ];
}
