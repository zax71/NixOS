{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    jetbrains.url = "github:liff/jetbrains-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      jetbrains,
    }:
    {
      packages.x86_64-linux.default = jetbrains.mkApp {
        inherit nixpkgs;
        ide = "idea"; # Or "pycharm", "webstorm", etc.
        plugins = [ ]; # Optional plugins.
      };
    };
}
