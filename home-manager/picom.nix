{ config, ... }:

{
  services.picom = {
    enable = true;
    vSync = true; # Screen tearing fix
    fade = true;
    fadeDelta = 3;
  };
}
