{ self, inputs, ... }: {
  flake.modules.nixos.awesomewm =
    { pkgs, ... }:
    {
      # Import the HM module here so oneself can never forget to do that.
      home-manager.users.zax.imports = with inputs.self.modules.homeManager; [ awesomewm ];
      services = {
        # Enable the X11 windowing system and AwesomeWM
        xserver = {
          enable = true;
          deviceSection = ''Option "TearFree" "true"'';
          #videoDrivers = [ "amdgpu" ];
          xkb = {
            layout = "gb";
          };
          windowManager.awesome = {
            enable = true;
            luaModules = with pkgs.luaPackages; [
              luarocks # is the package manager for Lua modules
              luadbi-mysql # Database abstraction layer
            ];
          };

        };
      };

      environment.variables = {
        AWESOME_THEMES_PATH = "/home/zax/.config/awesome/themes";
      };
    };

  flake.modules.homeManager.awesomewm = { ... }: {
    # Installing AwesomeWM is done in the NixOS part of this file

    # Copy the config in
    home.file."./.config/awesome" = {
      source = "${self}/config/awesomewm";
      recursive = true;
    };
  };
}
