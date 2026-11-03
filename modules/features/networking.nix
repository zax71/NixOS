{
  flake.modules.nixos.networking = { ... }: {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };
}
