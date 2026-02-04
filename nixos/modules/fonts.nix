{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      monocraft
      inter
      noto-fonts
      open-sans
      nerd-fonts.jetbrains-mono
      font-awesome
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };
}
