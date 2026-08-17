{
  flake.modules.nixos.shares =
    { config, ... }:
    let
      z-nas-options = [
        "noauto"
        "x-systemd.automount"
        "credentials=${config.sops.templates."z-nas-credentials".path}"
        "uid=${toString config.users.users.zax.uid}"
      ];

      z-nas-root = "//192.168.0.110/z-nas";
    in
    {
      fileSystems."/mnt/z-nas" = {
        device = z-nas-root;
        fsType = "cifs";

        options = z-nas-options;
      };

      fileSystems."/home/zax/Pictures" = {
        device = "${z-nas-root}/Pictures";
        fsType = "cifs";

        options = z-nas-options;
      };
    };
}
