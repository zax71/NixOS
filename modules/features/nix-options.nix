{
  flake.modules.nixos.nix-options =
    { ... }:
    {
      nix = {
        # Automatic cleanup
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 30d";
        };

        # Enable flakes
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          auto-optimise-store = true;
          trusted-users = [
            "root"
            "zax"
          ];
        };

      };
    };
}
