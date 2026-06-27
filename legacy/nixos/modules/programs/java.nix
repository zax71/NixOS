{ pkgs, ... }:
{
  programs.java = {
    enable = true;
    additionalRuntimes = {
      jdk25 = pkgs.jdk25;
      jdk21 = pkgs.jdk21;
      jdk17 = pkgs.jdk17;
      jdk8 = pkgs.jdk8;
    };
    package = pkgs.jdk21;

  };
}
