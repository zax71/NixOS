{ self, inputs, ... }: {

  flake.modules.nixos.z-pcConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports =
      with self.modules.nixos;
      [
        zax-base # Setup user and home manager
        base-desktop # Setup desktop specific services

        z-pc
        themeQT
        unstable
        secrets
        udev
        unstable
        bluetooth
        nix-options
        niri
        shares
        virtualisation

        keyring

        coreCliProgrammes
        desktopProgrammes
        developmentProgrammes
        gameProgrammes

      ]
      ++ [
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.z-pc

        # Legacy imports
        #./../../../legacy/nixos/modules/flatpak.nix
        ./../../../legacy/nixos/modules/networking.nix
        ./../../../legacy/nixos/modules/printing.nix
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
