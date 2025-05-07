{ pkgs, ... }:
{
  imports = [
    ./programs/zsh.nix
    ./programs/theme.nix
    ./programs/picom.nix
    ./programs/direnv.nix
    ./programs/ohmyposh
    ./programs/kitty.nix
    ./programs/zoxide.nix
    ./programs/rofi.nix
    ./programs/neovim
    ./programs/mpris-proxy.nix
    ./programs/yazi.nix
    ./programs/awesome
    ./programs/discord.nix
  ];
  home = {
    username = "zax";
    homeDirectory = "/home/zax";
    stateVersion = "24.05";
  };

  # I'd love a neater solution to this
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
    ];
}
