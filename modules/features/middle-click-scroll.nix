{ self, inputs, ... }: {
flake.nixosModules.middle-click-scroll = { ... }:
{
  services.libinput = {
    enable = true;
    mouse = {
      scrollMethod = "button";
      scrollButton = 2;
    };
  };
}
;
}