{ ... }:
{
  networking.firewall = {
    allowedUDPPorts = [
      6454 # Art-net
      5568 # sACN
    ];
  };

}
