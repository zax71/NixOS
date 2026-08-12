{ ... }: {
  flake.modules.homeManager.screenshots = { pkgs, ... }: {
    programs.satty = {
      enable = true;
      package = pkgs.unstable.satty;
      settings = {
        general = {
          copy-command = "wl-copy";
          fullscreen = "all";
          early-exit = [
            "copy"
            "save"
            "save-as"
          ];
        };
      };
    };

    home.packages = with pkgs; [
      grim # Dependancy of most Wayland screenshot tools
    ];
  };
}
