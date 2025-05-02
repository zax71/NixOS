{ ... }:
{
  # See https://yazi-rs.github.io/docs/installation/#nix for more options
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    keymap = {
      manager.prepend_keymap = [
        {
          on = [ "<C-n>" ];
          run = ''
            shell 'dragon -x -i -T "$1"' --confirm
          '';
          desc = ''Drag and Drop item'';
        }
      ];
    };
  };
}
