{ ... }:
{
  # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
  security.rtkit.enable = true;
  boot.extraModprobeConfig = ''
    options snd_hda_intel enable=0,1
  '';
}
