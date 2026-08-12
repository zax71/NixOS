{ self, inputs, ... }: {
  flake.modules.nixos.zax-base = { pkgs, config, ... }: {
    users = {
      groups = {
        plugdev = { };
      };

      users.zax = {
        shell = pkgs.zsh;
        isNormalUser = true;
        uid = 1000;
        extraGroups = [
          "wheel"
          "audio"
          "docker"
          "dialout"
          "plugdev"
          "tss" # TPM
        ];
      };
    };
    programs.zsh.enable = true;
    fonts = {
      packages = with pkgs; [
        monocraft
        inter
        noto-fonts
        open-sans
        nerd-fonts.jetbrains-mono
        nerd-fonts.departure-mono
        font-awesome

      ];

      fontconfig.defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Inter" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };

    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";
    console.keyMap = "uk";

    imports =
      with self.modules.nixos;
      [
        mime-types # What programme to use to open a file type - something that's user specific
      ]
      ++ [
        inputs.home-manager.nixosModules.home-manager # Bring in home manager from nixpkgs
      ];

    # Install Home Manager
    environment.systemPackages = with pkgs; [
      home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      backupFileExtension = "hmbckp";
      users.zax.imports = [
        inputs.self.modules.homeManager.zax-base # Import root HM config
      ];
    };
  };

  flake.modules.homeManager.zax-base =
    {
      config,
      pkgs,
      ...
    }:
    {
      imports =
        with inputs.self.modules.homeManager;
        [
          discord
          shell
          yazi
          helix
          noctalia
          screenshots
        ]
        ++ [
          ../../legacy/home-manager/home.nix
        ];

      home = {
        username = "zax";
        homeDirectory = "/home/zax";
        stateVersion = "26.05";
      };

      # I'd love a neater solution to this
      # nixpkgs.config.allowUnfreePredicate =
      #   pkg:
      #   builtins.elem (pkgs.lib.getName pkg) [
      #     "discord"
      #   ];
    };
}
