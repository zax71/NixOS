{ self, inputs, ... }: {
  flake.modules.nixos.base-desktop = { pkgs, ... }: {

    # Setup theming
    imports = with self.modules.nixos; [
      themeQT
    ];
    home-manager.users.zax.imports = with inputs.self.modules.homeManager; [
      themeGTK
    ];

    services = {
      udisks2.enable = true; # USB drive auto mounting
      gvfs.enable = true;
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
      };
    };

    # Use the KDE file picker & the like
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
      config.common.default = "*";
    };

    # Sound
    # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
    security.rtkit.enable = true;
    boot.extraModprobeConfig = ''
      options snd_hda_intel enable=0,1
    '';

    # Printing
    services = {
      printing = {
        enable = true; # CUPS
        drivers = [ pkgs.hplip ];
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
