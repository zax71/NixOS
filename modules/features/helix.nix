{
  flake.modules.homeManager.helix =
    { pkgs, lib, ... }:
    {
      programs.helix = {
        enable = true;
        defaultEditor = true;
        extraPackages = with pkgs; [
          nixd
          tinymist
          rust-analyzer
          nixfmt
          typstyle
          ty
          ruff
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
            "nixd" = {
              command = lib.getExe pkgs.nixd;
            };
            "tinymist" = {
              command = lib.getExe pkgs.tinymist;
            };
            "rust-analyzer" = {
              command = lib.getExe pkgs.rust-analyzer;
            };
            "ty" = {
              command = lib.getExe pkgs.ty;
            };
            "ruff" = {
              command = lib.getExe pkgs.ruff;
            };
          };
          language = [
            {
              name = "nix";
              formatter.command = lib.getExe pkgs.nixfmt;
              auto-format = true;
              language-servers = [ "nixd" ];
            }
            {
              name = "typst";
              formatter.command = lib.getExe pkgs.typstyle;
              auto-format = true;
              language-servers = [ "tinymist" ];
            }
            {
              name = "rust";
              formatter.command = lib.getExe pkgs.rustfmt;
              auto-format = true;
              language-servers = [ "rust-analyzer" ];
            }
            {
              name = "python";
              auto-format = true;
              formatter.command = lib.getExe pkgs.ruff;
              language-servers = [
                "ty"
                "ruff"
              ];
            }
          ];
        };
      };
    };
}
