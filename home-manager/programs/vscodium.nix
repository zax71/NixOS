{ pkgs, lib, ... }:
{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.black-formatter
        ms-python.python
        ms-python.debugpy
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
        streetsidesoftware.code-spell-checker
        mkhl.direnv
        tamasfe.even-better-toml
        github.vscode-github-actions
        golang.go
        jdinhlife.gruvbox
        ms-vscode.hexeditor
        james-yu.latex-workshop
        ltex-plus.vscode-ltex-plus
        sumneko.lua
        ms-vscode.makefile-tools
        jnoortheen.nix-ide
        esbenp.prettier-vscode
        yy0931.vscode-sqlite3-editor
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        myriad-dreamin.tinymist
        vscode-icons-team.vscode-icons
        wakatime.vscode-wakatime
      ];
      userSettings = {
        python.defaultInterpreterPath = lib.getExe pkgs.python315;
        black-formatter.path = [
          (lib.getExe pkgs.black)
        ];
        terminal.integrated.defaultProfile.linux = lib.getExe pkgs.zsh;
        workbench.startupEditor = "none";
        git.autofetch = true;
        git.confirmSync = false;
        files.associations = {
          "*.js" = "javascript";
          "*.css" = "tailwindcss";
          "*.json5" = "jsonc";
          "*.lua" = "lua";
        };
        explorer.confirmDelete = false;
        security.workspace.trust.untrustedFiles = "open";
        vsicons.dontShowNewVersionMessage = true;
        explorer.confirmDragAndDrop = false;
        cSpell.userWords = [
          "adafruit"
          "blurple"
          "bubbletea"
          "colour"
          "digitalio"
          "Gamerule"
          "Gamerules"
          "Groovi"
          "jank"
          "Lightbox"
          "markbates"
          "MOSI"
          "neopixel"
          "pulseio"
          "tailwindcss"
          "Toggleable"
          "Yeet"
        ];
        workbench.editorAssociations = {
          "{hexdiff}:/**/*.*" = "hexEditor.hexedit";
          "*.pdf" = "latex-workshop-pdf-hook";
        };
        update.mode = "none";
        "[python]" = {
          "editor.formatOnType" = true;
          "editor.defaultFormatter" = "ms-python.black-formatter";
        };
        "[svelte]" = {
          "editor.defaultFormatter" = "svelte.svelte-vscode";
        };
        "tailwindCSS.includeLanguages" = {
          svelte = "html";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[rust]" = {
          "editor.formatOnPaste" = true;
          "editor.formatOnSave" = true;
          "editor.inlayHints.enabled" = "offUnlessPressed";
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        "[HOCON]" = {
          "editor.defaultFormatter" = null;
        };
        "[go]" = {
          "editor.tabSize" = 4;
          "editor.defaultFormatter" = "golang.go";
        };
        "[latex]" = {
          "editor.wordWrap" = "on";
          "editor.defaultFormatter" = "James-Yu.latex-workshop";
        };
        latex-workshop.formatting.latex = "tex-fmt";
        git.enableSmartCommit = true;
        editor.linkedEditing = true;
        editor.formatOnSave = true;
        editor.formatOnPaste = true;
        svelte.enable-ts-plugin = true;
        update.showReleaseNotes = false;
        workbench.colorTheme = "Gruvbox Dark Hard";
        editor.unicodeHighlight.invisibleCharacters = false;
        window.commandCenter = false;
        workbench.layoutControl.enabled = false;
        explorer.confirmPasteNative = false;
        go.toolsManagement.autoUpdate = true;
        git.openRepositoryInParentFolders = "never";
        terminal.integrated.fontFamily = "monospace";
        terminal.integrated.fontSize = 13;
        go.useLanguageServer = true;
        workbench.iconTheme = "vscode-icons";
        "[lua]" = {
          editor.quickSuggestions = {
            comments = "inline";
            other = "on";
            strings = "on";
          };
          editor.semanticHighlighting.enabled = true;
        };
        chat.commandCenter.enabled = false;
        "[jsonc]" = {
          editor.defaultFormatter = "vscode.json-language-features";
        };
        editor.fontFamily = "JetBrains Mono";
        editor.fontLigatures = true;
        latex-workshop.latex.outDir = "%TMPDIR%";
        latex-workshop.latex.tools = [
          {
            name = "latexmk";
            command = "latexmk";
            args = [
              "-shell-escape"
              "-synctex=1"
              "-interaction=nonstopmode"
              "-file-line-error"
              "-cd"
              "-pdf"
              "-outdir=%OUTDIR%"
              "%DOC%"
            ];
            env = {
            };
          }
        ];
        ltex = {
          java.path = pkgs.jdk21;
          ltex-ls-plus.path = lib.getExe pkgs.ltex-ls-plus;
          language = "en-GB";
          additionalRules.motherTongue = "en-GB";
        };
        cSpell.language = "en-GB";
        terminal.integrated.initialHint = false;
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      };
    };
  };
}
