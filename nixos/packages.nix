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

    # Nvim deps
    ripgrep

    # Desktop applications
    firefox
    prismlauncher
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

    # Art
    aseprite
    gimp

    # Xorg deps
    libxkbcommon
    fontconfig

    # Games
    superTuxKart
    flightgear
  ];
}
