{ self, inputs, ... }:
{
  flake.nixosModules.zsh =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
    };
}
