{
  pkgs,
  lib,
  ...
}:
{
  qt = {
    enable = true;
    style.name = "Breeze-Dark";
    style.package = pkgs.kdePackages.breeze;
  };
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            gtk-theme = "adw-gtk3-dark";
          };
        };
      }
    ];
  };
}
