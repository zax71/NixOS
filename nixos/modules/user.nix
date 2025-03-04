{ pkgs, ... }:

{
  users.users.zax = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "dialout"
    ];
  };
}
