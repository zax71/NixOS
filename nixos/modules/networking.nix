{ ... }:
{
  networking.hostName = "z-pc";
  networking.networkmanager.enable = true;
  networking.firewall = {
    allowedUDPPortRanges = [
      {
        from = 4646;
        to = 4649;
      }
    ];
    allowedTCPPorts = [ 5173 ];
  };
}
