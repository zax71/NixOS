{ pkgs, ... }:

{
  users.users.zax = {
    shell = pkgs.zsh;
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "dialout"
    ];
  };
}
