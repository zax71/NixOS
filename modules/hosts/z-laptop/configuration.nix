{ self, inputs, ... }: {

  flake.modules.nixos.z-laptopConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports =
      with self.modules.nixos;
      [
        zax-base # Setup user and home manager
        base-desktop # Setup desktop specific services
        base-laptop # Packages required for laptops
        base

        z-laptop
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
        self.diskoConfigurations.z-laptop
      ];

    networking.hostName = "z-laptop";
    boot.loader.grub.device = "/dev/nvme0n1";
  };

}
