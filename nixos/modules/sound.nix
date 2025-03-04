{ ... }:
{
  # hardware.pulseaudio.enable = true;
  boot.extraModprobeConfig = ''
    options snd_hda_intel enable=0,1
  '';
}
