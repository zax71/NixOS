{ self, inputs, ... }:
{
  flake.nixosModules.openTabletDriver =
    { ... }:
    {
      hardware.opentabletdriver.enable = true;
    };
}
