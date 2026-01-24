{ pkgs, ... }:
{
  services.udev = {
    packages = with pkgs; [
      via
      qmk-udev-rules
    ];
  };
}
