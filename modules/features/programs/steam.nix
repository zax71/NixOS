{ self, inputs, ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      programs.steam.enable = true;
    };
}
