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
        base

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
  };

}
