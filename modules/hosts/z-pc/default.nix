{ self, inputs, ... }:
{
  flake.nixosConfigurations.z-pc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.zPcConfiguration
    ];
  };
}
