{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        picom
        home-manager

        # CLI apps
        vim 
        neovim
        wget
        bat
        eza
        unzip
        zip

        # Nvim deps
        ripgrep

        # Desktop applications
        firefox
        prismlauncher
        vlc
        kitty
        flameshot
        (discord.override {
          withVencord = true;
        })

        # KDE stuff
        dolphin
        kdePackages.qtsvg
        kdePackages.kio-fuse
        kdePackages.kio-extras
        kdePackages.qtstyleplugin-kvantum

        # GNOME stuff
        gnome.nautilus
       
        # Dev tools
        nodePackages.pnpm
        python313
        cargo
        rustc
        go
        git
        gh
        cmake
        gcc
        gnumake
        godot_4

        # Art
        aseprite
        gimp
  ];
}
