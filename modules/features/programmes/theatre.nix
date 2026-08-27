{
  self,
  inputs,
  ...
}:
{
  flake.modules.nixos.theatreProgrammes = { pkgs, ... }: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    # LiSP is not in Nixpkgs :(
    services.flatpak = {
      enable = true;
      packages = [
        "org.linuxshowplayer.LinuxShowPlayer"
      ];

      # Update Flatpak packages weekly
      update.auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
    };

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
