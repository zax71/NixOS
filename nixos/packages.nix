{ inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: _: {
      # this allows you to access `pkgs.unstable` anywhere in your config
      unstable = import inputs.nixpkgs-unstable {
        inherit (final.stdenv.hostPlatform) system;
        inherit (final) config;
      };
    })
  ];

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
    unstable.fastfetch
    cmus # Terminal music player
    sshfs
    btop-rocm
    alsa-utils
    lazygit
    tldr
    yt-dlp
    ffmpeg
    uv # A Python package manager. I should probably only use this in a dev flake...
    vulkan-tools
    neo-cowsay
    yazi
    exiftool
    caligula
    playerctl # MPRIS control, needed to get WH1000XM4 headset media controls to work
    sops # Secrets management for nix config

    # Nvim deps
    unstable.tailwindcss-language-server # This is an LSP, it isn't installed in the nvim config because the stable version doesn't work
    ripgrep # TODO: Move this in to home-manager

    # Desktop applications
    firefox
    thunderbird
    vlc
    kitty
    flameshot
    libreoffice
    zotero
    obsidian
    rsibreak
    vscode
    bottles # Run Windows apps
    audacity
    blender
    kicad
    unstable.yaak
    obs-studio
    unstable.bruno
    (discord.override { withVencord = true; })
    davinci-resolve
    rpi-imager
    gparted
    wireshark
    qgis # Mapping
    pika-backup

    # Art
    unstable.aseprite
    drawio
    unstable.gimp3
    nomacs # Image viewer
    darktable
    rawtherapee
    inkscape

    # KDE stuff
    dolphin
    kdePackages.breeze
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.qtstyleplugin-kvantum
    kdePackages.skanpage
    kdePackages.okular

    # GNOME stuff
    nautilus
    gtk3

    # Dev tools
    nodePackages.pnpm
    python314
    unstable.cargo
    rustc
    go
    git
    gh
    cmake
    gcc
    gnumake
    godot_4
    jetbrains.idea-community
    thonny
    nodejs_23
    redisinsight
    nixfmt-rfc-style
    plantuml
    graphviz # For PlantUML diagrams

    # Xorg deps
    libxkbcommon
    fontconfig

    # Games
    unstable.superTuxKart
    unstable.flightgear
    prismlauncher
  ];
}
