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
    exiftool
    caligula
    playerctl # MPRIS control, needed to get WH1000XM4 headset media controls to work
    sops # Secrets management for nix config
    dragon-drop # Yazi drag and drop
    luarocks
    wineWowPackages.stable # Wine
    appimage-run # Use this to run Appimages, they don't work by default
    bc # A calculator, required for the imagemagick multicrop script
    difftastic # A tool to create better diffs
    presenterm # CLI presentation tool

    # Nvim deps
    unstable.tailwindcss-language-server # This is an LSP, it isn't installed in the nvim config because the stable version doesn't work
    ripgrep # TODO: Move this in to home-manager

    # Desktop applications
    firefox
    epiphany # Ugh, webkit
    # chromium # Web dev is great...STOP BEING MY DEFAULT BROWSER FFS
    thunderbird
    vlc
    kitty
    flameshot
    libreoffice
    hunspell # Libreoffice spell checker
    zotero
    obsidian
    rsibreak
    # vscode.fhs
    unstable.vscodium.fhs # Goodbye Microsoft
    bottles # Run Windows apps
    audacity
    blender-hip
    kicad
    unstable.yaak
    obs-studio
    #unstable.bruno
    davinci-resolve
    unstable.rpi-imager
    gparted
    wireshark
    pika-backup
    qlcplus # lighting software
    annotator
    signal-desktop # e2ee chat
    gscan2pdf # Scanning
    naps2 # Scanning
    halloy # IRC
    unstable.kmidimon # MIDI packet sniffer
    qmidinet # Network midi send/reicieve
    lmms
    popsicle
    parabolic
    lorien # Infinate zoom whiteboarding
    anki # Flashcards

    # Art
    aseprite
    drawio
    unstable.gimp3
    nomacs # Image viewer
    darktable
    rawtherapee
    inkscape
    krita

    # KDE stuff
    kdePackages.breeze
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.qtstyleplugin-kvantum
    kdePackages.skanpage # Scanning
    kdePackages.okular
    kdePackages.marble # mapping
    kdePackages.kdenlive

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
    jetbrains.idea
    android-studio
    thonny
    nodejs_24
    redisinsight
    nixfmt-rfc-style
    plantuml
    graphviz # For PlantUML diagrams
    ninja
    tex-fmt # format LaTeX files, used in VSCode
    #gradle
    #esptool

    # Xorg deps
    libxkbcommon
    fontconfig

    # Games
    superTuxKart
    unstable.flightgear
    prismlauncher
    #dolphin-emu
  ];
}
