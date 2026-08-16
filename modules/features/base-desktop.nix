{ inputs, lib, ... }: {
  flake.modules.nixos.base-desktop = { ... }: {
    services = {
      udisks2.enable = true; # USB drive auto mounting
      gvfs.enable = true;
      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
