{ config, ... }:
{
  fileSystems."/home/zax/Pictures" = {
    device = "//z-nas.local/z-nas/Pictures";
    fsType = "cifs";

    options = [
      "noauto"
      "x-systemd.automount"
      "credentials=${config.sops.templates."z-nas-credentials".path}"
      "uid=${toString config.users.users.zax.uid}"
    ];
  };
}
