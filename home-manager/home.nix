{
  imports = [
    ./zsh.nix
    ./theme.nix
    ./picom.nix
    ./direnv.nix
    # ./modules/bundle.nix
  ];
  home = {
    username = "zax";
    homeDirectory = "/home/zax";
    stateVersion = "24.05";
  };

}
