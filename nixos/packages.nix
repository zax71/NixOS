{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager

    # CLI apps
    vim
    wget
    bat
    eza
    unzip
    zip
    fzf
    fastfetch
    cmus
    sshfs
    btop
    alsa-utils
    lazygit
    tldr
    yt-dlp

    # Nvim deps
    ripgrep

    # Desktop applications
    firefox
    vlc
    kitty
    flameshot
    libreoffice
    zotero
    via
    obsidian
    rsibreak
    vscode
    bottles
    audacity
    blender
    nomacs # Image viewer
    (discord.override {
      withVencord = true;
    })

    # KDE stuff
    dolphin
    kdePackages.breeze
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.qtstyleplugin-kvantum

    # GNOME stuff
    nautilus
    gtk3

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
    jetbrains.idea-community
    nodejs_23

    # Art
    aseprite
    gimp

    # Xorg deps
    libxkbcommon
    fontconfig

    # Games
    superTuxKart
    flightgear
    prismlauncher
  ];
}
