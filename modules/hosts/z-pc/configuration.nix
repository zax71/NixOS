{ self, inputs, ... }: {

  flake.modules.nixos.z-pc.configuration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.nixosModules.z-pc.disko
      self.nixosModules.z-pc.graphics
      self.nixosModules.z-pc.hardware
      self.nixosModules.z-pc.packages
      self.nixosModules.z-pc.inputs.disko.nixosModules.disko

      # Legacy imports
      ./../../../legacy/nixos/modules/awesomewm.nix
      ./../../../legacy/nixos/modules/bluetooth.nix
      ./../../../legacy/nixos/modules/docker.nix
      ./../../../legacy/nixos/modules/flatpak.nix
      ./../../../legacy/nixos/modules/fonts.nix
      ./../../../legacy/nixos/modules/java.nix
      ./../../../legacy/nixos/modules/keyring.nix
      ./../../../legacy/nixos/modules/LaTeX.nix
      ./../../../legacy/nixos/modules/locale.nix
      ./../../../legacy/nixos/modules/mime-types.nix
      ./../../../legacy/nixos/modules/networking.nix
      ./../../../legacy/nixos/modules/nix-options.nix
      ./../../../legacy/nixos/modules/opentabletdriver.nix
      ./../../../legacy/nixos/modules/printing.nix
      ./../../../legacy/nixos/modules/programs
      ./../../../legacy/nixos/modules/secrets
      ./../../../legacy/nixos/modules/shares
      ./../../../legacy/nixos/modules/sound.nix
      ./../../../legacy/nixos/modules/user.nix
      ./../../../legacy/nixos/modules/unstable.nix
      ./../../../legacy/nixos/modules/udev.nix
      ./../../../legacy/nixos/modules/virtualisation.nix
      ./../../../legacy/nixos/modules/xdg-portal.nix
      ./../../../legacy/nixos/modules/qtTheme.nix
      ./../../../legacy/nixos/modules/tpm.nix
    ];

    # nix.settings.experimental-features = [
    #   "nix-command"
    #   "flakes"
    # ];

    networking.hostName = "z-pc";
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

    # ...
  };

}
