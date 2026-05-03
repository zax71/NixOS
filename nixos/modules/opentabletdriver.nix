{ self, inputs, ... }: {
flake.nixosModules.opentabletdriver = { ... }:
{
  hardware.opentabletdriver.enable = true;
}
;
}