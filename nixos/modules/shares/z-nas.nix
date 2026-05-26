{ config, ... }:
{
  fileSystems."/mnt/z-nas" = {
    device = "//192.168.0.110/z-nas";
    fsType = "cifs";

    options = [
      "noauto"
      "x-systemd.automount"
      "credentials=${config.sops.templates."z-nas-credentials".path}"
      "uid=${toString config.users.users.zax.uid}"
    ];
  };
}
