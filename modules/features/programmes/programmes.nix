{ self, inputs, ... }: {
  flake.modules.nixos.programmes =
    { pkgs, ... }:
    {
      imports = with self.modules.nixos; [
        java-package
      ];

      programs.dconf.enable = true;

      hardware.opentabletdriver.enable = true;

      programs.ghidra = {
        enable = true;
        gdb = true;
      };

      programs.java = {
        enable = true;
        additionalRuntimes = {
          jdk25 = pkgs.jdk25;
          jdk21 = pkgs.jdk21;
          jdk17 = pkgs.jdk17;
          jdk8 = pkgs.jdk8;
        };
        package = pkgs.jdk21;
      };

      programs.steam.enable = true;

      virtualisation.docker.enable = true;

      programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
        package = pkgs.unstable.obs-studio;
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
          obs-vaapi # optional AMD hardware acceleration
          obs-gstreamer
          obs-vkcapture
        ];
      };
    };
}
