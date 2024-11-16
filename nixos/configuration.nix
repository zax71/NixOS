# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./disk-config.nix

    ];
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  networking.hostName = "z-pc"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/London";

  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "uk";
  #   useXkbConfig = true; # use xkb.options in tty.
  };


  # Enable the X11 windowing system and AwesomeWM
  services={
    xserver = {
      enable = true;
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
  };

  # fileSystems."/mnt/truenas" = {
  #   device = "//192.168.0.16/share";
  #   fsType = "cifs";
  #   options = [ "username=zax" "password=<tmp>" "x-systemd.automount" "noauto" ];
  # };

  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;
  boot.extraModprobeConfig = ''
    options snd_hda_intel enable=0,1
  '';

  # Screen tearing fix I hope
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zax = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" ]; # Enable ‘sudo’ for the user.
  };

  environment.variables = {
    AWESOME_THEMES_PATH = "/home/zax/.config/awesome/themes";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  # Fonts
  fonts.packages = with pkgs; [
    ( nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      }
    )
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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

