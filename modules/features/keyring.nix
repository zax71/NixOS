{
  flake.modules.nixos.keyring =
    { pkgs, ... }:
    {
      services.gnome.gnome-keyring.enable = true;
      security.pam.services.awesomewm.enableGnomeKeyring = true;

      environment.systemPackages = with pkgs; [
        seahorse # manage Gnome keyring
        libsecret
      ];
    };
}
