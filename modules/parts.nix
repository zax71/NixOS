{ inputs, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.disko.flakeModules.default
  ];
  config = {
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  };
}
