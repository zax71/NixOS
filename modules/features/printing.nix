{ self, inputs, ... }: {
flake.nixosModules.printing = { pkgs, ... }:
{
  services = {
    printing = {
      enable = true; # CUPS
      drivers = [ pkgs.hplip ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
;
}