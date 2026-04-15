{ pkgs, inputs, ... }:
{
  imports = [
    inputs.probe-rs-rules.nixosModules."x86_64-linux".default
  ];

  services.udev = {
    packages = with pkgs; [
      via
      qmk-udev-rules
    ];
  };

  # udev rules for using a RPI Debug Probe
  hardware.probe-rs.enable = true;
}
