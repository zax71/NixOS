{ ... }:
{
  networking.hostName = "z-pc";
  networking.networkmanager.enable = true;
  networking.firewall = {

    allowedTCPPorts = [ 5173 ];
    allowedUDPPorts = [
      4646
      4647
      4648
      4649
      6454
      5568
    ];
  };

}
