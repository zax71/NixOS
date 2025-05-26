{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      monocraft
      inter
      noto-fonts
      open-sans
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMono NF Regular" ];
    };
  };
}
