{ self, inputs, ... }: {
flake.nixosModules.nix-options = { ... }:
{
  nix = {
    # Automatic cleanup
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 30d";
    };

    # Enable flakes
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };
}
;
}