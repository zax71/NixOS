{
  flake.modules.nixos.desktopProgrammes = { pkgs, ... }: {

    programs.dconf.enable = true;
    hardware.opentabletdriver.enable = true;

    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      package = pkgs.unstable.obs-studio;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-vaapi # optional AMD hardware acceleration
        obs-gstreamer
        obs-vkcapture
      ];
    };

    environment.systemPackages = with pkgs; [

      ## Browsers
      firefox
      epiphany # Ugh, webkit
      # chromium # Web dev is great...STOP BEING MY DEFAULT BROWSER FFS

      ## Social
      dino # XMPP client
      kaidan # XMPP client
      thunderbird # email
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
      obsidian
      zotero
      texliveFull
      typst
      tinymist # Typst LSP

      ## Wine
      bottles # Run Windows apps
      wineWow64Packages.stable # Wine

      ## Productivity
      audacity
      pkgsRocm.blender
      kicad

      wireshark
      parabolic # Download YouTube videos
      via # Keyboard configuiration

      ## OpenStreetMap
      unstable.josm # Editor
      comaps # Renderer

      ## Art
      aseprite
      drawio
      unstable.gimp3
      nomacs # Image viewer
      darktable
      rawtherapee
      inkscape
      krita
      hugin # Panorama Stitcher
      unstable.siril # Astrophoto image processor
      python3 # Requirement for sirl, see nixpkgs#555759

    ];
  };
}
