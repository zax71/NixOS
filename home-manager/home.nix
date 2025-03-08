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
  ];
  home = {
    username = "zax";
    homeDirectory = "/home/zax";
    stateVersion = "24.05";
  };
}
