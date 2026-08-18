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

    # Sound
    # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
    security.rtkit.enable = true;
    boot.extraModprobeConfig = ''
      options snd_hda_intel enable=0,1
    '';
  };
}
