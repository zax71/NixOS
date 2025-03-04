networking.hostName = "z-pc";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedUDPPortRanges = [
      {
        from = 4646;
        to = 4649;
      }
    ];
  };