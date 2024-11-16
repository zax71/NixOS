{config, pkgs, lib, ...}: {
    qt = {
        enable = true;
        style.name = "Breeze-Dark";
        style.package = pkgs.kdePackages.breeze;
    };
    gtk = {
        enable = true;
        iconTheme = {
            package = pkgs.gnome.adwaita-icon-theme;
            name = "Adwaita";
        };
    };
}
