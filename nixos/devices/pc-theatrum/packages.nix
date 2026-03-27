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
    btop-rocm
    alsa-utils
    lazygit
    tldr
    yt-dlp
    ffmpeg
    neo-cowsay
    exiftool
    playerctl # MPRIS control, needed to get WH1000XM4 headset media controls to work
    sops # Secrets management for nix config
    dragon-drop # Yazi drag and drop
    luarocks
    bc # A calculator, required for the imagemagick multicrop script
    difftastic # A tool to create better diffs
    asciiquarium-transparent

    # Nvim deps
    unstable.tailwindcss-language-server # This is an LSP, it isn't installed in the nvim config because the stable version doesn't work
    ripgrep # TODO: Move this in to home-manager

    # Desktop applications
    firefox
    # chromium # Web dev is great...STOP BEING MY DEFAULT BROWSER FFS
    vlc
    kitty
    flameshot
    obsidian
    # vscode.fhs
    unstable.vscodium.fhs # Goodbye Microsoft
    audacity
    obs-studio
    gparted
    pika-backup
    parabolic
    seahorse # manage Gnome keyring
    libsecret

    # Art
    darktable

    # KDE stuff
    kdePackages.breeze
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.qtstyleplugin-kvantum
    kdePackages.skanpage # Scanning
    kdePackages.okular
    kdePackages.ark # Archive manager

    # GNOME stuff
    nautilus
    gtk3

    # Dev tools
    git
    gh
    cmake
    gcc
    gnumake

    # Xorg deps
    libxkbcommon
    fontconfig

    # Games
    superTuxKart
    #unstable.flightgear
    #prismlauncher
    dolphin-emu
  ];
}
