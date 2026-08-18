{ self, ... }: {
  flake.modules.nixos.developmentProgrammes = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      java-package
    ];

    networking.firewall.allowedTCPPorts = [
      5173 # Vite web dev host to LAN
    ];

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

    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
      # Dev tools
      gh
      devenv

      ## IDE
      godot
      jetbrains.idea
      android-studio
      android-tools
      thonny
      unstable.bruno # Web request IDE
      unstable.yaak # Web request IDE
      unstable.rpi-imager # Make Raspberry Pi SD card OS images
      unstable.vscodium.fhs # Goodbye Microsoft
    ];
  };
}
