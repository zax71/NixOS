{ self, inputs, ... }: {
  flake.modules.nixos.themeQT = { pkgs, lib, ... }: {
    imports = [ inputs.qtengine.nixosModules.default ];

    # Add your desired theme to your system packages
    environment.systemPackages = with pkgs.kdePackages; [
      breeze
      breeze.qt5 # Needed if you want Qt5 support.
      breeze-icons
    ];

    programs.qtengine = {
      enable = true;

      config = {
        theme = {
          colorScheme = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
          iconTheme = "breeze-dark";
          style = "breeze";

          font = {
            family = "Inter";
            size = 11;
            weight = -1;
          };

          fontFixed = {
            family = "JetBrainsMono Nerd Font";
            size = 11;
            weight = -1;
          };
        };

        misc = {
          singleClickActivate = false;
          menusHaveIcons = true;
          shortcutsForContextMenus = true;
        };
      };
    };
  };
}
