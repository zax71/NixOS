{
  pkgs,
  ...
}:
{
  imports = [
    ./disks.nix
    ./hardware-configuration.nix
    ./../../modules/fonts.nix
    ./../../modules/graphics.nix
    ./../../modules/locale.nix
    ./../../modules/mime-types.nix
    ./../../modules/networking.nix
    ./../../modules/nix-options.nix
    ./../../modules/programs/zsh.nix
    ./../../modules/programs/dconf.nix
    ./../../modules/sound.nix
    ./../../modules/user.nix
    ./../../modules/udev.nix
    ./../../modules/xdg-portal.nix
    ./../../modules/awesomewm.nix
    ./../../packages.nix

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

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita:dark";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };

  # Allow unfree programmes
  nixpkgs.config.allowUnfree = true;

  # Use latest kernal
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
