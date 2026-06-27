{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "org.linuxshowplayer.LinuxShowPlayer"
    ];

    # Update Flatpak packages weekly
    update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };
  };
}
