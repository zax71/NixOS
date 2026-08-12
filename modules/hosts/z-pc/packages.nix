{ self, inputs, ... }:
{

  flake.modules.nixos.z-pc =
    { pkgs, ... }:

    {
      environment.systemPackages = with pkgs; [
        home-manager

        #(pkgs.callPackage ./sacnview.nix { })

        # CLI apps
        ## Core CLI apps
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
        tldr
        vulkan-tools
        neo-cowsay
        exiftool
        playerctl # MPRIS control, needed to get WH1000XM4 headset media controls to work
        asciiquarium-transparent

        ## CLI utilities
        cmus # Terminal music player
        sshfs
        lazygit
        yt-dlp
        ffmpeg
        uv # A Python package manager. I should probably only use this in a dev flake...
        caligula
        luarocks
        wineWow64Packages.stable # Wine
        appimage-run # Use this to run Appimages, they don't work by default
        bc # A calculator, required for the imagemagick multicrop script
        difftastic # A tool to create better diffs
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
        davinci-resolve
        lmms
        kitty
        libreoffice
        hunspell # Libreoffice spell checker
        zotero
        obsidian
        # rsibreak # Replaced with Noctalia Shell Plugin
        # vscode.fhs
        unstable.vscodium.fhs # Goodbye Microsoft
        bottles # Run Windows apps
        audacity
        pkgsRocm.blender
        kicad
        unstable.yaak
        magicq # Chamsys lighting software

        unstable.bruno
        unstable.rpi-imager
        gparted
        wireshark
        pika-backup
        qlcplus # lighting software
        annotator
        gscan2pdf # Scanning
        unstable.kmidimon # MIDI packet sniffer
        parabolic
        via # Keyboard configuiration
        seahorse # manage Gnome keyring
        libsecret
        easyeffects
        pavucontrol
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
        cubiomes-viewer
        dolphin-emu
      ];
    };
}
