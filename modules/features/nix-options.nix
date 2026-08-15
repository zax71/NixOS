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

          # Enable binary cache for Noctalia as per
          # https://docs.noctalia.dev/noctalia/getting-started/nixos/?section=binary-cache#binary-cache
          extra-substituters = [ "https://noctalia.cachix.org" ];
          extra-trusted-public-keys = [
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          ];
        };

      };
    };
}
