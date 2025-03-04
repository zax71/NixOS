# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/desktop.nix

    ./modules/disko/desktop.nix
    ./modules/awesomewm.nix
    ./modules/fonts.nix
    ./modules/java.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/nix-options.nix
    ./modules/printing.nix
    ./modules/sound.nix

    ./packages.nix
  ];
  # Use GRUB
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "/dev/sda";
    };
  };

  # Middle click scroll
  services.libinput = {
    enable = true;
    mouse = {
      scrollMethod = "button";
      scrollButton = 2;
    };
  };

  # Screen tearing fix I hope
  hardware.graphics = {
    enable = true;
  };

  programs = {
    java = {
      enable = true;
      additionalRuntimes = {
        jdk23 = (pkgs.jdk23.override { enableJavaFX = true; });
        jdk21 = (pkgs.jdk21.override { enableJavaFX = true; });
        jdk17 = pkgs.jdk17;
        jdk8 = pkgs.jdk8;
      };
      package = pkgs.jdk21;
    };
    zsh.enable = true;
    dconf.enable = true;
    steam.enable = true;
  };
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zax = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "dialout"
    ];
  };

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita:dark";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
    EDITOR = "nix run /home/zax/nixos/programmes/nvim --"; # This is really dumb, yazi doesn't load the zsh config and hence aliases don't work
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
