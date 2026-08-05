{
  self,
  inputs,
  ...
}:
{
  flake.modules.homeManager.noctalia = { config, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;

      #settings = "/home/zax/nixos/config/noctalia.toml";
    };

    home.file."${config.home.homeDirectory}/.config/noctalia/config.toml".source =
      "${self}/config/noctalia.toml";
  };
}
