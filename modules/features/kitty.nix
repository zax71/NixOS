{
  flake.modules.homeManager.kitty = { ... }: {
    programs.kitty = {
      enable = true;

      settings = {
        # Fancy cursor
        cursor_shape = "underline";
        cursor_blink_interval = 0;
        default_pointer_shape = "arrow";

        font_family = "JetBrains Mono";
        background_opacity = 0.9;

        # No close confirm
        confirm_os_window_close = 0;
      };

      keybindings = {
        # CTRL+C copy or interrupt
        "ctrl+c" = "copy_and_clear_or_interrupt";
        "ctrl+alt+c" = "copy_ansi_to_clipboard";
        # CTRL+V paste
        "ctrl+v" = "paste_from_clipboard";
        # Open new tabs in same directory
        "ctrl+shift+t" = "new_tab_with_cwd";
      };

      mouseBindings = {
        # Putty paste
        "right press" = "grabbed,ungrabbed paste_from_clipboard";
      };

      themeFile = "Afterglow";
    };
  };
}
