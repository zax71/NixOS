{ self, inputs, ... }: {
flake.nixosModules.xdg-portal = { pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "*";
  };
}
;
}