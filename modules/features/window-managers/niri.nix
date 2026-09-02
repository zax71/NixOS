{ self, inputs, ... }: {
  flake.modules.nixos.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    home-manager.users.zax.imports = with inputs.self.modules.homeManager; [
      rofi
    ];

    environment.systemPackages = with pkgs; [
      wl-clipboard # Fix wayland clipboard
    ];
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
        settings = {
          spawn-at-startup = [
            "noctalia"
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          input = {
            keyboard.xkb.layout = "gb";
            focus-follows-mouse = _: {
              props = {
                max-scroll-amount = "10%";
              };
            };
            touchpad = {
              # Tap to click
              tap = { };
              # Disable touchpad while typing
              dwt = { };
              # Two finger tap right click, three for middle
              tap-button-map = "left-right-middle";
              click-method = "clickfinger";

              # natural-scroll = { }; # Doesn't seem to function as per niri#3403
            };
          };

          hotkey-overlay.skip-at-startup = { };

          prefer-no-csd = { };

          layout.gaps = 5;

          binds = {
            "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
            "Mod+Q".close-window = { };

            # "Mod+Space".spawn-sh = "noctalia msg panel-toggle launcher";
            # Use Rofi as it launches faster than the Noctalia launcher
            "Mod+Space".spawn-sh = "rofi -show drun";
            "Mod+period".spawn-sh = "rofi -show emoji";
            "Mod+C".spawn-sh = "rofi -show calc";

            "Mod+b".spawn-sh = lib.getExe pkgs.firefox;
            "Mod+Shift+s".spawn-sh = "grim - | satty -f -";
            "Mod+Shift+Slash".show-hotkey-overlay = { };

            "Mod+F".maximize-column = { };
            "Mod+G".fullscreen-window = { };
            "Mod+Control+Space".toggle-window-floating = { };
            "Mod+M".center-column = { };
            "Mod+O".move-window-to-monitor-left = { };

            "Mod+Left".focus-column-left = { };
            "Mod+Right".focus-column-right = { };
            "Mod+Up".focus-window-or-workspace-up = { };
            "Mod+Down".focus-window-or-workspace-down = { };

            "Mod+Shift+Left".move-column-left = { };
            "Mod+Shift+Right".move-column-right = { };
            "Mod+Shift+Up".move-window-up-or-to-workspace-up = { };
            "Mod+Shift+Down".move-window-down-or-to-workspace-down = { };

            "Mod+Ctrl+Left".set-column-width = "-5%";
            "Mod+Ctrl+Right".set-column-width = "+5%";
            "Mod+Ctrl+Up".set-window-height = "-5%";
            "Mod+Ctrl+Down".set-window-height = "+5%";

            "Mod+1".focus-workspace = "w0";
            "Mod+2".focus-workspace = "w1";
            "Mod+3".focus-workspace = "w2";
            "Mod+4".focus-workspace = "w3";
            "Mod+5".focus-workspace = "w4";
            "Mod+6".focus-workspace = "w5";
            "Mod+7".focus-workspace = "w6";
            "Mod+8".focus-workspace = "w7";
            "Mod+9".focus-workspace = "w8";
            "Mod+0".focus-workspace = "w9";

            "Mod+Shift+1".move-column-to-workspace = "w0";
            "Mod+Shift+2".move-column-to-workspace = "w1";
            "Mod+Shift+3".move-column-to-workspace = "w2";
            "Mod+Shift+4".move-column-to-workspace = "w3";
            "Mod+Shift+5".move-column-to-workspace = "w4";
            "Mod+Shift+6".move-column-to-workspace = "w5";
            "Mod+Shift+7".move-column-to-workspace = "w6";
            "Mod+Shift+8".move-column-to-workspace = "w7";
            "Mod+Shift+9".move-column-to-workspace = "w8";
            "Mod+Shift+0".move-column-to-workspace = "w9";

            "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
            "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
            "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "XF86AudioMicMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

            "XF86AudioPlay".spawn-sh = "${lib.getExe pkgs.playerctl} play-pause";
            "XF86AudioPause".spawn-sh = "${lib.getExe pkgs.playerctl} play-pause";
            "XF86AudioStop".spawn-sh = "${lib.getExe pkgs.playerctl} stop";
            "XF86AudioPrev".spawn-sh = "${lib.getExe pkgs.playerctl} previous";
            "XF86AudioNext".spawn-sh = "${lib.getExe pkgs.playerctl} next";

            "Mod+WheelScrollDown".focus-column-left = { };
            "Mod+WheelScrollUp".focus-column-right = { };
            "Mod+Ctrl+WheelScrollDown".focus-workspace-down = { };
            "Mod+Ctrl+WheelScrollUp".focus-workspace-up = { };
          };
          outputs = {
            "HDMI-A-1" = {
              position = _: {
                props = {
                  x = 1920;
                  y = 0;
                };
              };
            };

            "DP-1" = {
              position = _: {
                props = {
                  x = 0;
                  y = 0;
                };
              };
            };
          };
        };
      };
    };
}
