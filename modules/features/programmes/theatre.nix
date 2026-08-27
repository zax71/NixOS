{
  flake.modules.nixos.theatreProgrammes = { pkgs, ... }: {

    networking.firewall = {
      allowedUDPPorts = [
        6454 # Art-net
        5568 # sACN
      ];
    };
    environment.systemPackages = with pkgs; [
      magicq # Chamsys lighting software
      qlcplus # lighting software
      unstable.kmidimon # MIDI packet sniffer
    ];
  };
}
