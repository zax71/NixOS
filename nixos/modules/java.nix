# Forked from https://github.com/gytis-ivaskevicius/nixfiles/blob/master/config/dev.nix (MIT)
# Then forked again from https://github.com/cody-quinn/dotfiles/blob/master/modules/system/runtimes/java.nix
{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  javaCfg = config.programs.java;
  defaultEnvVariables = {
    XDG_DATA_HOME = mkDefault "$HOME/.local/share";
    XDG_CACHE_HOME = mkDefault "$HOME/.cache";
    XDG_CONFIG_HOME = mkDefault "$HOME/.config";
  };
in
{
  options = {
    programs.java.additionalRuntimes = mkOption {
      description = ''
        Java packages to install. Typical values are pkgs.jdk or pkgs.jre. Example:
        ```
          programs.java.additionalRuntimes = {
            inherit (pkgs) jdk11 jdk14 jdk15;
          };
        ```
        This snippet:
        1. Generates environment variables `JAVA_HOME<version>`
        2. Generates aliases `java<version>`
        3. Creates symlinked directories at `/nix/java-jdk<version>`
      '';
      default = { };
      type = with types; attrsOf package;
    };
  };

  config =
    let
      escapeDashes = it: replaceStrings [ "-" ] [ "_" ] it;

      javaPkgs = javaCfg.additionalRuntimes;
      javaAliases = mapAttrs' (
        name: value: nameValuePair "java-${name}" "${value.home}/bin/java"
      ) javaPkgs;
      javaTmpfiles = mapAttrsFlatten (name: value: "L+ /nix/java${name} - - - - ${value.home}") javaPkgs;
      javaEnvVariables = mapAttrs' (
        name: value: nameValuePair "JAVA_HOME_${toUpper (escapeDashes name)}" "${value.home}"
      ) javaPkgs;
    in
    {
      environment.variables = javaEnvVariables // defaultEnvVariables;
      environment.shellAliases = javaAliases;
      systemd.tmpfiles.rules = javaTmpfiles;
    };
}
