{ self, inputs, ... }:
{
  flake.nixosModules.dconf =
    { pkgs, ... }:
    {
      programs.dconf.enable = true;
    };
}
