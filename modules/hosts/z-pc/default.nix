{ self, inputs, ... }: {
  flake.nixosConfigurations.z-pc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.z-pc.configuration
    ];
  };

  flake.homeConfigurations.z-pc = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [
      ./../../../legacy/home-manager/home.nix
    ];
  };
}
