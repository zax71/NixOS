{
  imports = [
    ./zsh.nix
    ./theme.nix
    ./picom.nix
    ./direnv.nix
    ./ohmyposh.nix
    ./kitty.nix
    ./zoxide.nix
    ./rofi.nix
  ];
  home = {
    username = "zax";
    homeDirectory = "/home/zax";
    stateVersion = "24.05";
  };
}
