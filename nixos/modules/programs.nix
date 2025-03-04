{ pkgs, ... }:
{
  programs = {
    java = {
      enable = true;
      additionalRuntimes = {
        jdk23 = (pkgs.jdk23.override { enableJavaFX = true; });
        jdk21 = (pkgs.jdk21.override { enableJavaFX = true; });
        jdk17 = pkgs.jdk17;
        jdk8 = pkgs.jdk8;
      };
      package = pkgs.jdk21;
    };
    zsh.enable = true;
    dconf.enable = true;
    steam.enable = true;
  };
}
