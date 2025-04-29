{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.cifs-utils ];
  imports = [
    ./z-nas.nix
  ];
}
