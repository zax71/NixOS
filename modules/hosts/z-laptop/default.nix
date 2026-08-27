{ self, inputs, ... }: {
  flake.nixosConfigurations.z-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.z-laptopConfiguration

    ];
  };
}
