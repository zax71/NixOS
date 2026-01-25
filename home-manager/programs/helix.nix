{ pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      pkgs.nixd
      pkgs.tinymist
      pkgs.rust-analyzer
      pkgs.nixfmt-rfc-style
      pkgs.typstyle
    ];
    settings = {
      theme = "everforest_dark";

      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        indent-guides = {
          character = "┊";
          render = true;
          skip-levels = 1;
        };

      };

      keys = {
        normal = {
          "C-y" = [
            ":sh rm -f /tmp/unique-file"
            ":insert-output yazi \"%{buffer_name}\" --chooser-file=/tmp/unique-file"
            ":sh printf \"\x1b[?1049h\x1b[?2004h\" > /dev/tty"
            ":open %sh{cat /tmp/unique-file}"
            ":redraw"
          ];
        };
      };
    };

    languages = {
      language-server = {
        "nix" = {
          command = lib.getExe pkgs.nixd;
        };
        "typst" = {
          command = lib.getExe pkgs.tinymist;
        };
        "rust" = {
          command = lib.getExe pkgs.rust-analyzer;
        };
        "python" = {
          command = lib.getExe pkgs.pyright;
        };
      };
      language = [
        {
          name = "nix";
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          auto-format = true;
        }
        {
          name = "typst";
          formatter.command = lib.getExe pkgs.typstyle;
          auto-format = true;
        }
        {
          name = "rust";
          formatter.command = lib.getExe pkgs.rustfmt;
          auto-format = true;
        }
        {
          name = "python";
          formatter.command = lib.getExe pkgs.black;
          auto-format = true;
        }
      ];
    };
  };
}
