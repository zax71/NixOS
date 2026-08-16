{
  flake.modules.nixos.coreCliProgrammes = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
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

      ## Toys
      asciiquarium-transparent
      neo-cowsay

      ## CLI utilities
      cmus # Terminal music player
      sshfs
      lazygit
      yt-dlp
      ffmpeg
      caligula # Disk burning tool
      appimage-run # Use this to run Appimages, they don't work by default
      bc # A calculator, required for the imagemagick multicrop script
      presenterm # CLI presentation tool

    ];
  };
}
