{ inputs, lib, ... }: {
  flake.modules.nixos.base-desktop = { pkgs, ... }: {
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
  };
}
