{ self, inputs, ... }:
{
  flake.nixosModules.shares =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.cifs-utils ];
      imports = [
        self.nixosModules.zNas
        self.nixosModules.zNasPictures
      ];
    };
}
