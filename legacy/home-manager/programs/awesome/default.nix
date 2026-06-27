{ ... }:
{
  # Installing AwesomeWM is done in nixos/modules/awesomewm.nix

  # Copy the config in
  home.file."./.config/awesome" = {
    source = ./config;
    recursive = true;
  };
}
