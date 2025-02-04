{
  inputs,
  pkgs,
  config,
  ...
}:

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
    cmus
    sshfs
    btop
    alsa-utils
    lazygit
    tldr
    yt-dlp
    ffmpeg
    uv
    vulkan-tools
    neo-cowsay

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
    kicad
    nomacs # Image viewer
    unstable.bruno
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

    # Art
    unstable.aseprite
    gimp

    # Xorg deps
    libxkbcommon
    fontconfig

    # Games
    unstable.superTuxKart
    unstable.flightgear
    unstable.prismlauncher
  ];
}
