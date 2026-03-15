{ ... }:
{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.awesomewm.enableGnomeKeyring = true;
}
