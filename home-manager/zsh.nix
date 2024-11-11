{ config, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            neofetch = "fastfetch";
            ls = "eza --icons=always --width=100";
            ll = "eza -l -a --icons=always";
            tree = "ls --tree --git-ignore";
            cat = "batcat";
            # vim = "nvim";
            update = "sudo nixos-rebuild switch";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };
};
