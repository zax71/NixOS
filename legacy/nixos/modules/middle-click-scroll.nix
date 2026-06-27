{ ... }:
{
  services.libinput = {
    enable = true;
    mouse = {
      scrollMethod = "button";
      scrollButton = 2;
    };
  };
}
