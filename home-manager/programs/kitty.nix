{ config, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      # Fancy cursor
      cursor_shape underline
      cursor_blink_interval 0
      default_pointer_shape arrow
      # Putty paste
      mouse_map right press grabbed,ungrabbed paste_from_clipboard

      # CTRL+C copy or interrupt
      map ctrl+c copy_and_clear_or_interrupt
      # CTRL+V paste
      map ctrl+v paste_from_clipboard

      # Set fonts
      font_family JetBrainsMono NF Regular

      # Transparency
      background_opacity 0.9

      # Afterglow theme: https://github.com/dexpota/kitty-themes/blob/master/themes/Afterglow.conf
      background            #202020
      foreground            #d0d0d0
      cursor                #d0d0d0
      selection_background  #d0d0d0
      color0                #151515
      color8                #505050
      color1                #ac4142
      color9                #ac4142
      color2                #7e8d50
      color10               #7e8d50
      color3                #e5b566
      color11               #e5b566
      color4                #6c99ba
      color12               #6c99ba
      color5                #9e4e85
      color13               #9e4e85
      color6                #7dd5cf
      color14               #7dd5cf
      color7                #d0d0d0
      color15               #f5f5f5
      selection_foreground  #202020

      # Open new tabs in same directory
      map ctrl+shift+t new_tab_with_cwd 
    '';
  };
}
