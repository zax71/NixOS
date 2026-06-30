{ inputs, ... }: {
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

    # bring in Home Manager
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      backupFileExtension = "hmbckp";
      users.zax.imports = [
        inputs.self.modules.homeManager.zax-base
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
