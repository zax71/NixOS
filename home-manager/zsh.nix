{ config, ...}: {
    programs.zsh = {
        enable = false;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases =
            let
                flakeDir = "/home/zax/nixos";
            in {
            neofetch = "fastfetch";
            ls = "eza --icons=always --width=100";
            ll = "eza -l -a --icons=always";
            tree = "ls --tree --git-ignore";
            cat = "bat";
            # vim = "nvim";
            update = "sudo nixos-rebuild switch --flake ${flakeDir}";
            update-home-manager = "home-manager switch --flake ${flakeDir}";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };
}
