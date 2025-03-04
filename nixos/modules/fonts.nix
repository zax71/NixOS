{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      monocraft
      inter
      noto-fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMono NF Regular" ];
    };
  };
}
