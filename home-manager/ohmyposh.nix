{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (
      builtins.unsafeDiscardStringContext (builtins.readFile ../programmes/ohmyposh/config.toml)
    );
  };
}
