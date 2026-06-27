{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager

    #(pkgs.callPackage ./sacnview.nix { })

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
    wineWow64Packages.stable # Wine
    appimage-run # Use this to run Appimages, they don't work by default
    bc # A calculator, required for the imagemagick multicrop script
    difftastic # A tool to create better diffs
    presenterm # CLI presentation tool
    typst
    tinymist # Typst LSP
    asciiquarium-transparent
    devenv

    # Nvim deps
    unstable.tailwindcss-language-server # This is an LSP, it isn't installed in the nvim config because the stable version doesn't work
    ripgrep # TODO: Move this in to home-manager

    # Desktop applications
    firefox
    epiphany # Ugh, webkit
    # chromium # Web dev is great...STOP BEING MY DEFAULT BROWSER FFS
    dino
    movim
    kaidan
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
    pkgsRocm.blender
    kicad
    unstable.yaak
    teams-for-linux # Remove soon I hope :(
    magicq # Chamsys lighting software

    unstable.bruno
    davinci-resolve
    unstable.rpi-imager
    gparted
    wireshark
    pika-backup
    qlcplus # lighting software
    annotator
    unstable.signal-desktop # e2ee chat
    gscan2pdf # Scanning
    halloy # IRC
    unstable.kmidimon # MIDI packet sniffer
    lmms
    parabolic
    anki # Flashcards
    via # Keyboard configuiration
    element-desktop
    fluffychat
    cinny-desktop
    seahorse # manage Gnome keyring
    libsecret
    easyeffects
    pavucontrol

    # Art
    aseprite
    drawio
    unstable.gimp3
    nomacs # Image viewer
    unstable.darktable
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
    kdePackages.ark # Archive manager

    # GNOME stuff
    nautilus
    gtk3

    # Dev tools
    pnpm
    unstable.cargo
    rustc
    go
    git
    gh
    cmake
    gcc
    gdb
    lldb
    gnumake
    godot_4
    jetbrains.idea
    android-studio
    android-tools
    thonny
    nodejs_24
    nixfmt
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
    supertuxkart
    # unstable.flightgear
    prismlauncher
    dolphin-emu
  ];
}
