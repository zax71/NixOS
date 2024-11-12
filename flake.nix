{
    description = "System config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };

       home-manager = {
           url = "github:nix-community/home-manager/release-24.05";
           inputs.nixpkgs.follows = "nixpkgs";
       };
    };

    outputs = { self, nixpkgs, home-manager, disko, ... }@inputs:
        let
            system = "x86_64-linux";
        in {
        nixosConfigurations.z-pc = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                ./nixos/configuration.nix
                disko.nixosModules.disko
            ];
        };

       homeConfigurations.zax = home-manager.lib.homemanagerConfiguration {
           pkgs = nixpkgs.legacyPackages.${system};
           modules = [ ./home-manager/home.nix ];
       };
    };
}
