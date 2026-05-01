{ self, inputs, ... }:
{

  flake.nixosModules.zPcConfiguration =
    { pkgs, lib, ... }:
    {
      # import any other modules from here
      imports = [
        self.nixosModules.zPcHardware
        self.nixosModules.zPcGraphics
        self.nixosModules.zPcPackages
        self.nixosModules.awesomewm
        self.nixosModules.bluetooth
        self.nixosModules.docker
        self.nixosModules.flatpak
        self.nixosModules.fonts
        self.nixosModules.java
        self.nixosModules.keyring
        self.nixosModules.LaTeX
        self.nixosModules.locale
        self.nixosModules.mime-types
        self.nixosModules.networking
        self.nixosModules.nix-options
        self.nixosModules.openTabletDriver
        self.nixosModules.printing
        self.nixosModules.programs
        self.nixosModules.secrets
        self.nixosModules.shares
        self.nixosModules.sound
        self.nixosModules.user
        self.nixosModules.unstable
        self.nixosModules.udev
        self.nixosModules.virtualisaiton
        self.nixosModules.xdg-portal

        inputs.disko.nixosModules.disko
        self.diskoConfigurations.zPcDisko
      ];

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

      environment.variables = {
        QT_QPA_PLATFORMTHEME = "qt5ct";
        GTK_THEME = "Adwaita:dark";
        GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
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

    };
}
