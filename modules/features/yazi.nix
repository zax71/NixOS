{
  flake.modules.homeManager.yazi = { pkgs, lib, ... }: {
    # See https://yazi-rs.github.io/docs/installation/#nix for more options
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;

      keymap = {
        mgr.prepend_keymap = [
          {
            on = [ "<C-n>" ];
            run = ''
              shell '${lib.getExe pkgs.dragon-drop} -x -i -T "$1"' --confirm
            '';
            desc = "Drag and Drop item";
          }
        ];
      };
    };
  };
}
