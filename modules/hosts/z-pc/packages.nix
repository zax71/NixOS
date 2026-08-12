{ self, inputs, ... }:
{

  flake.modules.nixos.z-pc =
    { pkgs, ... }:

    {
      environment.systemPackages = with pkgs; [

        #(pkgs.callPackage ./sacnview.nix { })

        # CLI apps
        ## Core CLI apps / standard utils replacements
        vim
        wget
        bat
        eza
        unzip
        zip
        fzf
        unstable.fastfetch
        git
        btop-rocm
        alsa-utils
        tldr
        vulkan-tools
        exiftool
        difftastic # A tool to create better diffs

        ## CLI utilities
        cmus # Terminal music player
        asciiquarium-transparent
        neo-cowsay
        sshfs
        lazygit
        yt-dlp
        ffmpeg
        caligula # Disk burning tool
        luarocks
        appimage-run # Use this to run Appimages, they don't work by default
        bc # A calculator, required for the imagemagick multicrop script
        presenterm # CLI presentation tool
        typst
        tinymist # Typst LSP
        devenv

        # Desktop applications
        ## Browsers
        firefox
        epiphany # Ugh, webkit
        # chromium # Web dev is great...STOP BEING MY DEFAULT BROWSER FFS

        ## Social
        dino # XMPP client
        kaidan # XMPP client
        thunderbird
        unstable.signal-desktop # e2ee chat
        halloy # IRC
        element-desktop # Matrix clients
        fluffychat
        cinny-desktop

        ## Media
        vlc
        davinci-resolve # Video editor
        kdePackages.kdenlive # Video editor
        lmms
        magicq # Chamsys lighting software
        qlcplus # lighting software

        ## Core desktop apps
        kitty # Terminal
        gparted # Partition editor
        pika-backup
        kdePackages.okular # PDF viewer
        kdePackages.skanpage # Scanning
        kdePackages.ark # Archive manager
        nautilus # File manager

        ## Writing
        libreoffice
        hunspell # Libreoffice spell checker
        zotero
        obsidian

        ## Wine
        bottles # Run Windows apps
        wineWow64Packages.stable # Wine

        ## Productivity
        audacity
        pkgsRocm.blender
        kicad

        wireshark
        unstable.kmidimon # MIDI packet sniffer
        parabolic
        via # Keyboard configuiration

        josm # OpenStreetMap editor
        comaps # OpenStreetMap Renderer

        # Art
        aseprite
        drawio
        unstable.gimp3
        nomacs # Image viewer
        darktable
        rawtherapee
        inkscape
        krita
        hugin # Panorama Stitcher

        # KDE stuff
        kdePackages.qtsvg
        kdePackages.kio-fuse
        kdePackages.kio-extras
        kdePackages.qtstyleplugin-kvantum

        # GNOME stuff
        gtk3

        # Dev tools
        gh

        ## IDE
        godot
        jetbrains.idea
        android-studio
        android-tools
        thonny
        unstable.bruno # Web request IDE
        unstable.yaak # Web request IDE
        unstable.rpi-imager # Make Raspberry Pi SD card OS images
        unstable.vscodium.fhs # Goodbye Microsoft

        # Games
        supertuxkart
        # unstable.flightgear
        prismlauncher
        cubiomes-viewer
        dolphin-emu
      ];
    };
}
