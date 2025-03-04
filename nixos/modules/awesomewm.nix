{ pkgs, ... }:
{
  services = {
    # Enable the X11 windowing system and AwesomeWM
    xserver = {
      enable = true;
      deviceSection = ''Option "TearFree" "true"'';
      videoDrivers = [ "modesetting" ];
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
    udisks2.enable = true; # USB drive auto mounting
    gvfs.enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };

    # openssh.enable = true;
  };

  environment.variables = {
    AWESOME_THEMES_PATH = "/home/zax/.config/awesome/themes";
  };
}
