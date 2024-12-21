# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./disk-config.nix
    ./java.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Use GRUB
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "/dev/sda";
    };
  };

  # Networking
  networking.hostName = "z-pc";
  networking.networkmanager.enable = true;

  # i18n
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  console = {
    # font = "Lat2-Terminus16";
    keyMap = "uk";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # Middle click scroll
  services.libinput = {
    enable = true;
    mouse = {
      scrollMethod = "button";
      scrollButton = 2;
    };
  };

  services = {
    # Enable the X11 windowing system and AwesomeWM
    xserver = {
      enable = true;
      deviceSection = ''Option "TearFree" "true"'';
      videoDrivers = [ "modesetting" ];
      xkb = {
        layout = "gb";
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];
      };
    };

    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };

    # Printing
    printing.enable = true; # CUPS
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # openssh.enable = true;
  };

  # fileSystems."/mnt/truenas" = {
  #   device = "//192.168.0.106/share";
  #   fsType = "cifs";
  #   options = [ "username=zax" "password=<password>" "x-systemd.automount" "noauto" ];
  # };

  # Sound
  # hardware.pulseaudio.enable = true;
  boot.extraModprobeConfig = ''
    options snd_hda_intel enable=0,1
  '';

  # Screen tearing fix I hope
  hardware.graphics = {
    enable = true;
  };

  programs = {
    java = {
      enable = true;
      additionalRuntimes = {
        jdk23 = (pkgs.jdk23.override { enableJavaFX = true; });
        jdk21 = pkgs.jdk21;
        jdk17 = pkgs.jdk17;
        jdk8 = pkgs.jdk8;
      };
      package = pkgs.jdk21;
    };
    zsh.enable = true;
    dconf.enable = true;
    steam.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zax = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
    ]; # Enable ‘sudo’ for the user.
  };

  environment.variables = {
    AWESOME_THEMES_PATH = "/home/zax/.config/awesome/themes";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita:dark";
  };
  # Fonts
  fonts = {
    packages = with pkgs; [
      monocraft
      inter
      noto-fonts
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMono NF Regular" ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
