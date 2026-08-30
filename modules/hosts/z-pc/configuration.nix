{ self, inputs, ... }: {

  flake.modules.nixos.z-pcConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports =
      with self.modules.nixos;
      [
        zax-base # Setup user and home manager
        base-desktop # Setup desktop specific services
        base

        z-pc
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
        theatreProgrammes

      ]
      ++ [
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.z-pc

        # Legacy imports
        #./../../../legacy/nixos/modules/flatpak.nix
      ];
    networking.hostName = "z-pc";
    boot.loader.grub.device = "/dev/sda";
  };

}
