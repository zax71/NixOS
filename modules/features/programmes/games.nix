{
  flake.modules.nixos.gameProgrammes = { pkgs, ... }: {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [
      supertuxkart
      # unstable.flightgear
      prismlauncher
      cubiomes-viewer
      dolphin-emu
    ];
  };
}
