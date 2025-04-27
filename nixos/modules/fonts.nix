{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      monocraft
      inter
      noto-fonts
      open-sans
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMono NF Regular" ];
    };
  };
}
