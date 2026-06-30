{ ... }: {
  flake.modules.homeManager.shell = { config, ... }: {

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases =
        let
          flakeDir = "/home/zax/nixos";
        in
        {
          neofetch = "fastfetch";
          ls = "eza --icons=always --width=100";
          ll = "eza -l -a --icons=always";
          tree = "ls --tree --git-ignore";
          cat = "bat";
          update = "sudo nixos-rebuild switch --flake ${flakeDir}#$HOST";
          #update-home-manager = "home-manager switch --flake ${flakeDir}";
          top = "btop";
          cd = "z";
          cdi = "zi";
          code = "codium";
        };

      initContent = ''
        alias -s md='bat'
        alias -s mp4='xdg-open'
        alias -s mp3='xdg-open';
      '';

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zellij = {
      enable = true;
      #enableZshIntegration = true;
      settings = {
        theme = "everforest-dark";
        show_startup_tips = false;
      };
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        version = 2;
        final_space = true;
        console_title_template = "{{ .Shell }} in {{ .Folder }}";
        blocks = [
          {
            type = "prompt";
            alignment = "left";
            newline = true;
            segments = [
              {
                type = "path";
                style = "powerline";
                powerline_symbol = "";
                background = "yellow";
                foreground = "darkGray";
                template = " {{ .Path }} ";
                properties = {
                  style = "full";
                };
              }
              {
                type = "git";
                style = "powerline";
                powerline_symbol = "";
                background = "cyan";
                foreground = "darkGray";
                template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} {{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}";
                properties = {
                  commit_icon = "@";
                  fetch_status = true;
                };
              }
            ];
          }
          {
            type = "rprompt";
            overflow = "hidden";
            segments = [
              {
                type = "executiontime";
                style = "plain";
                foreground = "yellow";
                background = "transparent";
                template = "{{ .FormattedMs }}";
                properties = {
                  threshold = 5000;
                };
              }
            ];
          }
          {
            type = "prompt";
            alignment = "left";
            newline = true;
            segments = [
              {
                type = "text";
                style = "plain";
                foreground_templates = [
                  "{{if gt .Code 0}}red{{end}}"
                  "{{if eq .Code 0}}magenta{{end}}"
                ];
                background = "transparent";
                template = "❯";
              }
            ];
          }
        ];
        transient_prompt = {
          foreground_templates = [
            "{{if gt .Code 0}}red{{end}}"
            "{{if eq .Code 0}}magenta{{end}}"
          ];
          background = "transparent";
          template = "❯ ";
        };
        secondary_prompt = {
          foreground = "magenta";
          background = "transparent";
          template = "❯❯ ";
        };
      };
    };
  };
}
